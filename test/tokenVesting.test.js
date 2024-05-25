// test/tokenVesting.test.js
const TokenVesting = artifacts.require("TokenVesting");

contract("TokenVesting", accounts => {
  // Write your test cases here
  // Example:
  it("should deploy TokenVesting contract", async () => {
    const tokenVestingInstance = await TokenVesting.deployed();
    // Add assertions or functionality tests
  });
});
