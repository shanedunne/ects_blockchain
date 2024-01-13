// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// this contract controls the creation of all educational institutions within the system
// the ownership of this contract will be a multisig

contract EducationalInstitutionController {
    // owner set as deployer for initial phase
    address public owner;

    // Structure to hold institution details
    struct Institution {
        string name;
        bool isRegistered;
        string country;
        string city;

    }

    // Mapping of institution addresses to their details
    mapping(address => Institution) public institutions;

    // Event to emit when a new institution is registered
    event InstitutionRegistered(address indexed institutionAddress, string name);

    // Constructor sets the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to register a new institution
    function registerInstitution(address _institutionAddress, string memory _name, string memory _country, string memory _city) public onlyOwner {
        require(!institutions[_institutionAddress].isRegistered, "Institution is already registered");

        institutions[_institutionAddress] = Institution(_name, true, _country, _city);

        emit InstitutionRegistered(_institutionAddress, _name);
    }

    // Function to check if an institution is registered
    function isRegistered(address _institutionAddress) public view returns (bool) {
        return institutions[_institutionAddress].isRegistered;
    }
}
