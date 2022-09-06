git add .
If($args.Length > 0){
    git commit -m $Args[0]
}Else{
    git commit -m "Update"
}
git push

cd _site
git add .
If($args.Length > 0){
    git commit -m $Args[0]
}Else{
    git commit -m "Update"
}
git push
cd ../