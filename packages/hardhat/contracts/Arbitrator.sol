// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "./Random.sol";
import "./interfaces/IERC20.sol";

contract Arbitor {
    uint256 dealId = 1;
    address arbitor;
    address buyer;
    address seller;

    mapping (address => bytes32) ownerToProof;
    mapping (uint256 => address[]) traders;

    error UnSupportedType();

    enum ProductType {
        TOKEN,
        PROOF
    }

    constructor() {
        arbitor = address(this);
    }

    function buy(address token, uint256 amountIn, uint256 dealId) public payable {
        buyer = msg.sender;
        IERC20(token).transferFrom(buyer, address(this), amountIn);
        traders[dealId].push(buyer);
        ++dealId;
    }

    function sell(ProductType type, address token, uint256 amountIn, bytes memory proof, uint256 dealId) public payable {
        seller = msg.sender;
        if (type == ProductType.TOKEN) {
            IERC20(token).transferFrom(seller, address(this), amountIn);
        } else if (type == ProductType.PROOF) {
            ownerToProof[seller] = keccak256(abi.encodePacked(seller, proof));
        } else {
            revert UnSupportedType();
        }
        traders[dealId].push(seller);
    }

    function deal(ProductType type, uint256 dealId) public {
        address[] traders = traders[dealId];
        require (traders.length() == 2, "invalid number of traders");
        require(traders[0] == msg.sender || traders[1] == msg.sender, "invalid trader");
        
        if (type == ProductType.TOKEN) {
            
        }
    }
}
