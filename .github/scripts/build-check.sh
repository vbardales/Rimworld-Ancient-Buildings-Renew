#!/usr/bin/env bash
set -euo pipefail

# Optional: when .github/publish.config.json names a build project (build.project), rebuild it on the runner, report
# whether the rebuilt Mod/ differs from the tracked one, then put the tracked files back. What ships is what is
# committed and was tested: on 2026-09-25 the runner's DLL of a mod differed from the committed one (same source, same
# reference assemblies), so the difference is a report, not a reason to ship the rebuilt file. A project that does not
# compile stops the run.
#
# A build can also leave a file Git never tracked (an extra DLL, an obj/bin artifact not gitignored). stageModContent
# ships whatever sits in Mod/ on disk, tracked or not, so such a file would ship untested unless it is removed too:
# `git checkout` alone only restores tracked files. Files the build creates that are already gitignored (the .dds
# copies, for instance) are left alone, since those are an accepted, expected byproduct, not a stray one.
#
#   build-check.sh            (run at the root of the commit being published)
config=".github/publish.config.json"
project="$(node -e "const c = JSON.parse(require('fs').readFileSync(process.argv[1], 'utf8')); process.stdout.write(c.build?.project ?? '')" "$config")"
if [[ -z "$project" ]]; then
  echo "No build project in $config: the tracked Mod/ ships as it is."
  exit 0
fi
[[ -f "$project" ]] || { echo "the build project $project does not exist in this commit" >&2; exit 1; }

dotnet build "$project" -c Release --nologo
changed="$(git diff --name-only -- Mod)"
untracked="$(git ls-files --others --exclude-standard -- Mod)"
summary="${GITHUB_STEP_SUMMARY:-/dev/null}"
if [[ -z "$changed" && -z "$untracked" ]]; then
  echo "The build reproduces the tracked Mod/ byte for byte." | tee -a "$summary"
else
  if [[ -n "$changed" ]]; then
    echo "::warning::The runner's build differs from the tracked Mod/: the committed files ship, not the rebuilt ones."
    {
      echo "The runner's build differs from the tracked files below. The committed (tested) ones ship, the rebuilt ones are discarded:"
      while IFS= read -r file; do echo "- $file: committed $(git show "HEAD:$file" | sha256sum | cut -d' ' -f1), rebuilt $(sha256sum "$file" | cut -d' ' -f1)"; done <<<"$changed"
    } | tee -a "$summary"
    git checkout -- Mod
  fi
  if [[ -n "$untracked" ]]; then
    echo "::warning::The build left files under Mod/ that Git does not track: they are discarded, not shipped."
    { echo "New, untracked files the build left under Mod/ (discarded, not shipped):"; while IFS= read -r file; do echo "- $file"; done <<<"$untracked"; } | tee -a "$summary"
    git clean -fd -- Mod
  fi
fi
