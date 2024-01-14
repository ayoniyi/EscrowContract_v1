// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    enum State { AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE }

    State public currState;

    address payable admin; 
    address public buyer;
    address payable public seller;

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this method");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this method");
        _;
    }

    modifier transactionNotCreated() {
        require(buyer == address(0) && seller == payable(address(0)), "Transaction already created");
        _;
    }

    constructor() {
         admin = payable(msg.sender);
    }

    function createTransaction(address _buyer, address payable _seller) external transactionNotCreated {
        require(_buyer != address(0) && _seller != address(0), "Invalid buyer or seller address");
        buyer = _buyer;
        seller = _seller;
    }

    function deposit() onlyBuyer external payable {
        require(currState == State.AWAITING_PAYMENT, "Already paid");
        currState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() onlyBuyer external {
        require(currState == State.AWAITING_DELIVERY, "Cannot confirm delivery");
         uint256 payment  = address(this).balance - 30000000000000000;
        seller.transfer(payment);
        admin.transfer(address(this).balance);
       
        currState = State.COMPLETE;
    }

    function getBalance(address _seller) public view returns (uint256) {
        require(_seller == seller, "Invalid seller address");
        return address(this).balance;
    }
}
