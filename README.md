# Questions and Challenges, Example Motoko Bootcamp 2023

Change dfx.json file for every day.

```bash
## start local replica - terminal 1
dfy start --clean

## deploy canister - terminal 2

# create canister for the first time
dfx canister create motoko

# check the build
dfx build --check

# deploy the build
dfx deploy motoko

# call a canister function
dfx canister call motoko multiply '(2, 5)'
``` 
