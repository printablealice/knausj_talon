# XXX - figure how to disable the git talon file to avoid conflicts
# switch fugitive to git
os: linux
app: /term/
#mode: vim
-

fugitive diff: ":Gdiff"
fugitive split diff: ":Gsplitdiff!"
fugitive write: ":Gwrite"
fugitive force write: ":Gwrite!"
