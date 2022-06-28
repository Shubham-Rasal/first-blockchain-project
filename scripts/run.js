const main = async () => {
    const [owner, randomPerson, r1] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy(
        {
            value: hre.ethers.utils.parseEther("0.1"),
        }
    );
    await waveContract.deployed();
    console.log("Contract deployed to:", waveContract.address);
    console.log("contract deployed by : ", owner.address);


    let contractBalance = await hre.ethers.provider.getBalance(
        waveContract.address
    );

    console.log(
        "Contract balance:",
        hre.ethers.utils.formatEther(contractBalance)
    );


    //calling functions

    // console.log(await waveTxn.wait());
    let waveCount = await waveContract.getTotalWaves();
    let waveTxn = await waveContract.wave("Hey from run.js !");
    await waveTxn.wait();
    
    waveCount = await waveContract.getTotalWaves();
    let allWaves = await waveContract.getAllWaves();
    
    waveCount = await waveContract.getTotalWaves();
    waveTxn = await waveContract.connect(r1).wave("Hey from run.js !");
   await waveTxn.wait();

     contractBalance = await hre.ethers.provider.getBalance(
        waveContract.address
    );
    console.log(
        "Contract balance:",
        hre.ethers.utils.formatEther(contractBalance)
    );


};

const runMain = async () => {
    try {
        await main();
        process.exit(0); // exit Node process without error
    } catch (error) {
        console.log(error);
        process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
    }
    // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();