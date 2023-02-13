// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// importing libraries
import "@openzeppelin/contracts@4.8.0/token/ERC721/ERC721.sol"; //core standard
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721Enumerable.sol";    //Numerable
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721URIStorage.sol";    //URI

// Commented to enable minting
// import "@openzeppelin/contracts@4.8.0/access/Ownable.sol";      function protection for priviledge
import "@openzeppelin/contracts@4.8.0/utils/Counters.sol";      //Keep track of NFT ID

// Inheriting
contract MrKing is ERC721, ERC721Enumerable, ERC721URIStorage  {
    // Initializing COUNTERS library
    using Counters for Counters.Counter;

    // new private variable
    Counters.Counter private _tokenIdCounter;
    // Declaring new int constant
    uint256 MAX_SUPPLY = 10000; 
    uint256 MAX_MINT = 5;

    constructor() ERC721("MrKing", "JH4") {}

    // Minting
    function safeMint(address to, string memory uri) public  {
        uint256 tokenId = _tokenIdCounter.current();
        // Similar to if-else
        require(tokenId <= MAX_SUPPLY, "Sorry, ALL NFT's have been minted.");

        
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
