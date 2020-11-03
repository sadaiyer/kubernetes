
# Git commands
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

Working area   -- Staging Area     -- Local Repo  -- Remote Repo


git init
git status
git add . or git add *
git push
git commit -m "message"

To create an alias
git remote add hv https://github.com/sadaiyer/hitachi.git

git push -a -m "message"  --can use this only for modified files


git branch development --create branch
git branch --to view
git diff development -- to view difference between development and current branch
git push aliasname branchname

```
</p>
</details>


# Branch vs Tags
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

Branch Vs Tags
Branches are mutable, tags are immutable
Branch - during development, tags for production
Tags are created on master branch, not other branches

git tag tagname --to create tag
git tag --to view all tags
git push aliasname tag tn

git push aliasname --all  -- will push only branches, not tags
git push aliasname --tags

Why tags: Tags are created to version your code

e.g
git tag hitachiv1.0.0  (major, minor, release)

git remote -v (to view remote branches)
git push hv tag hitachiv1.0.0

Once you create a tag, you get a zip and tar version of the code, and hence the version of the code is frozen, hence immutable



```
</p>
</details>


# GIT STASH
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

GIT STASH command
Assuming you have master and development branch and you are working on dev branch

Since the code is WIP, you are not commiting the code in dev.  Say, now you have to handle a prod issue and therefore need to switch to master branch
If you do so, the code will be visible in master
so instead do "git stash"
Whatever will be available in working area it will create a temporary backup, allowing you to switch to other branch

git stash --will make a copy of working code
git stash list --To list all stashes
git stash apply --to get back to your stash

To apply a specific stash, if you have multiple stasjes
git stash apply --will apply the most recent stash
git stash apply <stash#>

git stash drop --will delete the most recent stash
git stash drop <stash#>

To combine stash and drop
git stash pop


```
</p>
</details>


# Git Cherry-pick
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
master
     |
     V
     development.  c1. c2. c3. c4 (4 commits)
git merge development - to merge dev with master
all commits will be merged

git cherry-pick <commitID>

To list all commits, 
git log

To switch to another branch

git checkout <branch>

```
</p>
</details>




# Git Clone
## To Clone a repo
### Note 

<details><summary>show</summary>
<p>

```bash
git clone <URL>
Now if the repo gets updated, you can use git pull or git fetch to pull the updated code
git pull <URL>
or
git fetch <URL>

Working copy   -- Staging area      -- Local repo       -- Remote Repo

<--------------------------------------------------------git pull
<-------------------------------------git merge
                                    
                                    <-------git fetch------->

Git pull = git fetch + get merge

Git pull - get from remote repo to Working copy

Git merge - local repo to working copy

Git fetch - remote repo to local repo

When to use git fetch vs get pull

When you need to fetch the remote repo, use git pull
If you do git fetch first, and if 2 people are working on the same copy, then git merge can help to resolve conflicts.  If you do git pull now, it will overwrite the changes since there is no merge for conflict checking


```
</p>
</details>


# Github and using ssh keys
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

When using ssh, need to do some config, and no username and password required unlike https based access

ssh-keygen --to create ssh keys

cd ~/.ssh
id_rsa              --private key
id_rsa.pub          --public key
known_hosts         --list of known hosts
authorized_keys   

ssh -T git@github.com (or the URL of the enterprise github repo)

ssh-copy-id command --https://www.ssh.com/ssh/copy-id

```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>








