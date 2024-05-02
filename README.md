# Local setup guide

## Backend setup steps

If you are using windows, trying doing this all in wsl, you can download it from here: https://learn.microsoft.com/en-us/windows/wsl/install

1. **Install dojo toolchain**

   - Follow the steps given here to install the dojo toolchain: https://book.dojoengine.org/getting-started/quick-start
   - make sure you are on sozo version 0.6.0 (you can check it using `sozo --version`)
   - Once done with the installation, run the command `katana --disable-fee` in one of the terminals.

2. **Working on Code**
   - clone/fork the repo
   - go to dojo-starter directory
   - try building the project using the command `sozo build`
   - once built, try migrating it to the local katana instance by using `sozo migrate apply`
   - once migrated successfully, you will a get world address where the smart contract has been deployed.
   - we have to grant access to the users for this application in order for them to interact with the models we have deployed. run the command `sh scripts/default_auth.sh `
   - now take that world address we code after deploying the contract and in another terminal we run `torii --world world_address`, here replace the `world_address` with the real one.
   - let's go the client code now, so go the client directory
   - install all dependencies using the command `npm install`
   - run the client using command `npm run dev`
   - go to `http://localhost:5173/` and checkout the basic application. (mini change)
