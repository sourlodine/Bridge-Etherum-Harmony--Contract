pragma solidity 0.5.17;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";

contract BridgedNFTToken is ERC721Mintable, ERC721Burnable, ERC721Full {
    address public ethTokenAddr;
    uint256 public counter;
    constructor(
        address _ethTokenAddr,
        string memory name,
        string memory symbol
    ) public ERC721Full(name, symbol) {
        ethTokenAddr = _ethTokenAddr;
    }

    function increment() public onlyMinter {
        counter += 1;
    }

    function decrement() public onlyMinter {
        counter -= 1;
    }

    function checkSupply(uint256 value) public view returns (bool) {
        return counter == value;
    }
}