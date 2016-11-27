#!/usr/bin/env bash

branch_name='master1'

istmpBranch=`git branch --list $branch_name`

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

echo $branch


# if [  ]; then
#    echo "Branch name $branch_name already exists."
# fi

# message() {
# 	printf "\033[1;32m :: %s\n\033[0m" "$1"
# }

# GITUSER=ppeiris
# REPONAME=https://github.com/ppeiris/ppeirisweb.git
# HUGOSRC=ppeiris.src

# # delete the master branch
# message "Deleting the \`master\` branch"
# git branch -D master
# git push origin --delete master


# # create a orphaned master branch
# message "Creating orphaned master branch"
# git checkout --orphan master
# git rm --cached $(git ls-files)

# # checkout the src from the README.md file from the src branch
# message "Grabing README file from the \`$HUGOSRC\` branch"
# git checkout "$HUGOSRC" README.md
# git commit -m "Initial commit on master branch with the README file"

# # push to master branch
# git push origin master

# # checkout the src branch
# git checkout -f "$HUGOSRC"

# # remove the public dir
# rm -rf public
# git add -u
# git commit -n "Remove public folder"

# # add the master branch as a subtree
# message "Add the master branch as a subtree"
# git subtree add --prefix=public --squash $REPONAME master

# message "Pulling down the just committed file to help avoid merge conflicts"
# git subtree pull --prefix=public $REPONAME master
