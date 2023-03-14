// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyToken is ERC721, AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant VIP_ROLE = keccak256("VIP_ROLE");
    bytes32 public constant WHITELIST_ROLE = keccak256("WHITELIST_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    // uint8 public constant TOTAL_SUPPLY = 5;

    constructor() ERC721("MyToken", "MTK") {
        _grantRole(ADMIN_ROLE, msg.sender);
        _grantRole(VIP_ROLE, msg.sender);
        _grantRole(WHITELIST_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        // _totalSupply = TOTAL_SUPPLY;
    }

    function safeMint(address to, uint256 tokenId) public onlyRole(MINTER_ROLE) {
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}