# Upstream rights evidence

Checked on 2026-09-13 Europe/Paris; evidence collection completed at
2026-09-12T23:26:02.9330750Z. Audited port content revision:
`e389720674c46092553b0d86a382465f5fa5bd25`. These files are audit evidence outside Mod/.

## Sources and method

- Original installed package:
  `C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2566355159`.
  Read outside the restricted sandbox; the previous failed sandbox lookup did not establish
  absence. `source-inventory.json` records all 14 files, byte sizes and SHA256 hashes.
  There is no licence/readme file. `original-About.xml` records author SyndicateGamingNetwork,
  packageId ancientbld.core, version 1.3 only, a short description and no repository URL.
- Live public page, retrieved with PowerShell Invoke-WebRequest:
  https://steamcommunity.com/sharedfiles/filedetails/?id=2566355159&l=english
  Preserved as `steam-page.html`. Description inspected in full; no licence, permission,
  prohibition or source repository link. Last update shown: 6 August 2021.
- All public comments, retrieved with Invoke-RestMethod:
  https://steamcommunity.com/comment/PublishedFile_Public/render/76561198042208687/2566355159/?start=0&count=100&l=english
  Preserved as `steam-comments.json`. The reported total is 26, and the returned HTML
  contains 26 comment text elements. All were read, including author replies under the
  current display name Siyndee. No licence, reuse permission or prohibition was found.

The removal and incompatibility notices in the raw Steam page both have `display: none`.
Their appearance in the earlier search extraction was a template artifact, not evidence
that the item was removed. The author name in the original package remains credited.

## Decision

The inspected package and public statements substantiate `silent` under the user's
workflow: the source remains at 1.3, has not been updated since 2021, and no explicit
licence or permission was found. This is a bounded evidence-based classification, not
an assertion about every possible private communication or a grant of upstream rights.
No explicit prohibition was found either. The public/unofficial designation, removal
undertaking and MIT scope limited to port additions remain coherent with that decision.

The first workflow transition now passes alongside the already verified independent Git
repository, public GitHub origin and pushed commit. No source assets or mod functionality
were changed. The icon's 32 px visual check was completed afterwards: its result is `ModIcon-32.png`
in this folder, and `STATUS.md` records it.

## Where the raw captures are

`steam-page.html` and `steam-comments.json` are on disk only, ignored by git since 2026-09-24. They
hold another author's page and the names and words of the people who commented on it, which do not
belong in a public repository. This README, `source-inventory.json`, `original-About.xml` and
`ModIcon-32.png` are what is versioned. The raw files are the dated proof behind the `silent`
decision and the live page can change, so they are not deleted: 155 KB in all.
