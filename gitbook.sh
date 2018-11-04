git pull origin master
git add .
gitbook build 
mv _book/* book-end
cd book-end
git add .
git commit -m "update"
git push origin gh-pages
cd ../
git add .
git commit -m "update"
git push origin master