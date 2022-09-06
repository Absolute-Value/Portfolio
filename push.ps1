git add .
git commit -m $Args[0]
git push

cd _site
git add .
git commit -m $Args[0]
git push
cd ../