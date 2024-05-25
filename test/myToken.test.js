// test/myToken.test.js
const MyToken = artifacts.require("MyToken");

contract("MyToken", accounts => {
  it("should deploy MyToken with the correct initial supply", async () => {
    const myTokenInstance = await MyToken.deployed();
    const totalSupply = await myTokenInstance.totalSupply();
    assert.equal(totalSupply, 1000000, "Total supply is incorrect");
  });

  it("should allow locking tokens for a specific account", async () => {
    const myTokenInstance = await MyToken.deployed();
    const accountToLock = accounts[1];
    const amountToLock = 1000;

    await myTokenInstance.lockTokens(accountToLock, amountToLock, { from: accounts[0] });

    const lockedAmount = await myTokenInstance.lockedTokens(accountToLock);
    assert.equal(lockedAmount, amountToLock, "Tokens were not locked for the account");
  });
});
