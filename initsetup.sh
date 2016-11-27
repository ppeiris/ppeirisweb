#!/usr/bin/env bash

message() {
	printf "\033[1;31m => %s\n\033[0m" "$1"
}

tmpbranch="tmpbranch"
SOURCE=ppeiris.src
REPO=https://github.com/ppeiris/ppeirisweb.git
USERNAME=ppeiris

if git show-ref --verify --quiet "refs/heads/$tmpbranch"; then
	message "tmp Branch $tmpbranch already exists."
	message "Deleting existing $tmpbranch ..."
	git checkout master
	git branch -D $tmpbranch
	message "Creating a $tmpbranch"
	git branch $tmpbranch
	git checkout $tmpbranch
fi


message "Deleting the \`master\` branch"
git branch -D master
git push origin --delete master

message "Creating an empty, orphaned \`master\` branch"
git checkout --orphan master
git rm --cached $(git ls-files)

message "Grabbing one file from the \`$SOURCE\` branch so that a commit can be made"
git checkout "$SOURCE" README.md
git commit -m "Initial commit on master branch"
git push origin master

message "Returning to the \`$SOURCE\` branch"
git checkout -f "$SOURCE"

message "Removing the \`public\` folder to make room for the \`master\` subtree"
rm -rf public
git add -u
git commit -m "Remove stale public folder"

message "Adding the new \`master\` branch as a subtree"
git subtree add --prefix=public $REPO master --squash

message "Pulling down the just committed file to help avoid merge conflicts"
git subtree pull --prefix=public $REPO master
