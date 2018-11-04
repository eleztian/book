git pull origin master
gitbook build 
mv _book/* book-end
rm -rf _book
cd book-end
git add .
git commit -m "update"
git push origin gh-pages
cd ../
git add .
git commit -m "update"
git push origin master --force
