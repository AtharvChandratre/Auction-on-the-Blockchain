pragma solidity ^0.4.17;
contract Auction {
    
    struct Item {
        uint itemId; // id of the item
        uint[] itemTokens;  //tokens bid in favor of the item
       
    }
    
    struct Person {
        uint remainingTokens; // tokens remaining with bidder
        uint personId; // it serves as tokenId as well
        address addr;//address of the bidder
    }
 
    mapping(address => Person) tokenDetails; //address to person 
    Person [4] bidders;
    
    Item [3] public items;
    address[3] public winners;//Array for address of winners of each item being bidded for
    address public beneficiary;//owner of the smart contract
    
    uint bidderCount=0;//counter

    constructor() public payable{ 
        beneficiary=msg.sender;//Initialize beneficiary with address of smart contract’s owner
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});//Three items up for auction
        items[1] = Item({itemId:1,itemTokens:emptyArray});
        items[2] = Item({itemId:2,itemTokens:emptyArray});
    }
    

    function register() public payable{
        bidders[bidderCount].personId = bidderCount;
        bidders[bidderCount].addr=msg.sender;//Bidder addresses being stored in an array
        bidders[bidderCount].remainingTokens = 5;//Tokens bidable by each bidder
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }
    
    function bid(uint _itemId, uint _count) public payable{} //WRITE THIS
    
    
    function revealWinners() public onlyOwner{
        for (uint id = 0; id < 3; id++) {
            Item storage currentItem=items[id];
            if(currentItem.itemTokens.length != 0){
            uint randomIndex = (block.number / currentItem.itemTokens.length)% currentItem.itemTokens.length; //random number generated from block number
            uint winnerId = currentItem.itemTokens[randomIndex];
            winners[id]=bidders[winnerId].addr;
            }
        }
    }
} 
