import { readdir, stat } from 'node:fs/promises';
import { join } from 'node:path';

// Steam's gallery accepts both images and short videos; both are listed here, or the reminder below
// would silently miss a video file and the person uploading by hand would never know it was left out.
const GALLERY_FILE = /\.(png|jpe?g|gif|mp4|mov|webm)$/i;

// The gallery (screenshots, videos) is not sent by this workflow: SteamCMD's workshop.vdf has one
// image field, previewfile, so the gallery is uploaded by hand on the Steam page. This lists the
// files the person will upload, so the dry-run is also the reminder of that manual step.
export async function listGallery(dir) {
  const names = (await readdir(dir, { withFileTypes: true })).filter((entry) => entry.isFile() && GALLERY_FILE.test(entry.name)).map((entry) => entry.name).sort();
  return Promise.all(names.map(async (name) => ({ name, bytes: (await stat(join(dir, name))).size })));
}

export function formatGallery(files, folder) {
  if (files.length === 0) return `gallery: no file in ${folder}`;
  const rows = files.map((file) => `  ${file.name}  ${file.bytes.toLocaleString('en-US')} bytes`);
  return [`gallery (${files.length} files in ${folder}, uploaded by hand on the Steam page; the workflow does not send it):`, ...rows].join('\n');
}
