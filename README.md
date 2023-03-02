## Intro
- Provide the useful shell command for kubernete in c2 and c2product development.

## Before you use
Please copy the following in `~/.zshrc` for further use, then run `source ~/.zshrc` once you done the copy-paste.
```shell 
alias c2="cd ~/houzz/c2";
alias c2p="cd ~/houzz/c2product";
alias mpf="cd ~/mpf-toolkits";

# rq login alias
alias l="KUBECONFIG=${HOME?}/teleport.yaml tsh login --proxy=teleport.k8s-mgmt.stghouzz.com:443 --auth=github"
alias rqs="cd ~/mpf-toolkits/; sh k8s.sh -rsi ";
alias rqsl="cd ~/mpf-toolkits/; sh k8s.sh -lrsi ";
alias rqp="cd ~/mpf-toolkits/; sh k8s.sh -rpi ";
alias rqpl="cd ~/mpf-toolkits/; sh k8s.sh -lrpi ";
alias c="cd ~/mpf-toolkits/; sh k8s.sh -ci ";
alias cl="cd ~/mpf-toolkits/; sh k8s.sh -cli ";

# c2product
alias c2pu="sh ../../mpf-toolkits/c2product_upload.sh";`
```

## login debug pods
if You need to login, just add an l in the command
**RQ prod**
```shell 
rqp $podName
```
**RQ staging**
```shell 
rqs $podName
```
**c2-codepath** 
```shell 
c $podName
```
**pure login**
```shell 
l
```
## update c2product files
go to your c2product directory, then run 
```shell 
c2pu
```
