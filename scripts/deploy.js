const { ethers } = require("hardhat");

async function main() {

    const [deployer] = await ethers.getSigners();

    const Stop_factory = await ethers.getContractFactory("STOP");
    const contract = await Stop_factory.deploy("0x4838B106FCe9647Bdf1E7877BF73cE8B0BAD5f97");

    console.log("Deployed contract address: " + contract.address)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
