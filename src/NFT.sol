// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GoldNFT is ERC721URIStorage {
    using Strings for uint256;

    uint256 private _nextTokenId;
    uint256 private _tokenId;
    string private nftUri;
    uint256 private _mintPrice;

    constructor() ERC721("GoldNFT", "GOLD") {
        _tokenId = 1;
    }

    function mint() public payable {
        require(msg.value >= _mintPrice, "Mint Price is Low!");
        _mint(msg.sender, _tokenId);
        _tokenId++;
    }

    function setMintPrice(uint256 mintPrice) public {
        _mintPrice = mintPrice;
    }
    // QmWeGVX8Uo6PopZE1z89dwXUJ1hcpeJQzjRanMARM5xLLE/1.json

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : "";
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return nftUri;
    }

    function setNftUri(string memory _nftUri) public {
        nftUri = _nftUri;
    }
}
