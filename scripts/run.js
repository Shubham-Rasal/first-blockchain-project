const main = async () => {
    const [owner, randomPerson , r1] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract deployed to:", waveContract.address);
    console.log("contract deployed by : ", owner.address);


    //calling functions

    let waveCount = await waveContract.getTotalWaves();
    let waveTxn = await waveContract.wave("Hey from run.js !");
    // console.log(await waveTxn.wait());
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();
    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);


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