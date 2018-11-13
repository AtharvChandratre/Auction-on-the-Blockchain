var BidderData = artifacts.require("./BidderData.sol");

module.exports = function(deployer) {
  deployer.deploy(BidderData);
};

var Auction = artifacts.require("./Auction.sol");

module.exports = function(deployer) {
  deployer.deploy(Auction);
};

