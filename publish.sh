#!/bin/sh
npm version patch
docco bot.rb -o .
docco -l plain-markdown -o md bot.rb
mv md/bot.html ./README.md
rm -Rf md
git add . && git commit
git push origin master
git branch gh-pages
git checkout gh-pages
git merge master
git push --set-upstream origin gh-pages
git checkout master
npm publish
