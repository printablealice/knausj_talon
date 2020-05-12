tag: terminal
-

# Standard commands
git add patch: insert("git add . -p\n")
git add: insert("git add ")
git add everything: insert("git add -u\n")
git bisect: insert("git bisect ")
git blame: insert("git alame ")
git branch: insert("git branch ")
git branch <phrase>: insert("git branch {phrase}")
git checkout: insert("git checkout ")
git checkout master: insert("git checkout master\n")
git checkout <phrase>: insert("git checkout {phrase}")
git cherry pick: insert("git cherry-pick ")
git clone: insert("git clone ")
git clone clipboard:
  insert("git clone ")
  edit.paste()
  key(enter)
git commit message <phrase>$: insert('git commit -m "{phrase}"')
git commit: insert("git commit\n")
git diff (colour|color) words: insert("git diff --color-words ")
git diff: insert("git diff ")
git diff cached: insert("git diff --cached\n")
git fetch: insert("git fetch\n")
git fetch <phrase>: insert("git fetch {phrase}")
git in it: insert("git init\n")
git log: insert("git log\n")
git merge: insert("git merge ")
git merge <phrase>:insert("git merge {phrase}")
git move: insert("git mv ")
git new branch: insert("git checkout -b ")
git pull: insert("git pull\n")
git pull origin: insert("git pull origin ")
git pull rebase: insert("git pull --rebase\n")
git pull <phrase>: insert("git pull {phrase} ")
git push: insert("git push\n")
git push origin: insert("git push origin ")
git push to upstream: insert("git push -u origin ")
git push <phrase>: insert("git push {phrase} ")
git push tags: insert("git push --tags\n")
git rebase: insert("git rebase\n")
git rebase continue: insert("git rebase --continue")
git rebase skip: insert("git rebase --skip")
git remote show origin: insert("git remote show origin")
git remote add upstream: "git remote add upstream"
git remove: insert("git rm ")
git reset: insert("git reset ")
git reset soft: insert("git reset --soft ")
git reset hard: insert("git reset --hard ")
git show: insert("git show ")
git stash pop: insert("git stash pop\n")
git stash: insert("git stash\n")
git status: insert("git status\n")
git submodule init: "git submodule init\n"
git submodule update: "git submodule update --remote"
git tag: insert("git tag ")

# Convenience
git edit config: "git config --local -e\n"

# Linux shell git specific
# XXX - Ideally ctrl-shift-v could be integrated as an edit.paste() command for
# terminal eventually
git diff highlighted:
    key(ctrl-shift-c)
    insert("git diff ")
    key(ctrl-shift-v)
    key(enter)
git diff clipboard:
    insert("git diff ")
    key(ctrl-shift-v)
    key(enter)

git add highlighted:
    key(ctrl-shift-c)
    insert("git add ")
    key(ctrl-shift-v)
    key(enter)

git add clipboard:
    insert("git add ")
    key(ctrl-shift-v)
    key(enter)

git commit highlighted:
    key(ctrl-shift-c)
    insert("git add ")
    key(ctrl-shift-v)
    insert("\ngit commit\n")
