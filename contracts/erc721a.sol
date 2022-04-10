//SPDX-License-Identifier: MIT  
pragma solidity ^0.8.11;  

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/cryptography/MerkleProof.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';  
import "erc721a/contracts/ERC721A.sol";  
  
contract Parrhesia is ERC721A, Ownable, ReentrancyGuard {  
  using Strings for uint256;

  bytes32 public merkleRoot;
  mapping(address => bool) public whitelistClaimed;

  string public uriPrefix =
  string public uriSuffex =
  string public hiddenMetadataURI;

  uint256 public cost;
  uint256 public maxSupply;
  uint256 public maxMintAmountPerTx;

  bool public paused = true;
  bool public whitelistMintEnabled = false;
  bool public revealed = false;

    constructor
    (
      string memory _tokenName,
      string memory _tokenSymbol,
      string memory _hiddenMetadataURI,
      uint256 _cost,
      uint256 _maxSupply,
      uint256 _maxAmountPerTx
    )
    ERC721A(_tokenName, _tokenSymbol)
    {
      setCost(_tokenName, _tokenSymbol)
      maxSupply = _maxSupply;
      setMaxMintAmountPerTx(_maxAmountPerTx);
      setHiddenMetadataURI(_hiddenMetadataURI)
    }  
  
    function mint(uint256 quantity) external payable {  
        // _safeMint's second argument now takes in a quantity, not a tokenId.  
  _safeMint(msg.sender, quantity);  
  }  
}