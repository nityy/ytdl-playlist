youtube-dl https://www.youtube.com/playlist?list=PLW-dXebzrk5B6PAmm-h2PJz82j6_222Vu --embed-thumbnail -o '/home/nitish/%(playlist)s/%(title)s - %(uploader)s - %(id)s.%(ext)s' -f 140 -i --no-continue --no-overwrites --download-archive downloaded.txt --add-metadata > log.txt ;\
youtube-dl https://www.youtube.com/playlist?list=PLW-dXebzrk5B6PAmm-h2PJz82j6_222Vu -i --flat-playlist --get-id > playlist.txt ;\
youtube-dl https://www.youtube.com/playlist?list=PLW-dXebzrk5B6PAmm-h2PJz82j6_222Vu --get-id -i -o '%(title)s - %(uploader)s.%(ext)s' --get-filename > check_availability.txt ;\
awk '{print $2}' downloaded.txt > output.txt ;\
grep -vxFf output.txt playlist.txt > missing.txt ;\
rm output.txt ;\
git add . ;\
git commit -m "update" ;\
git push origin main
