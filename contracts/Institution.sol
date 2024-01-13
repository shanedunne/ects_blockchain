// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EducationalInstitutionController.sol";

// this contract is created by the controller contract and is managed by the educational institutions

contract Institution {
    address public controllerAddress;
    EducationalInstitutionController controller;

    // enum to dictate the delivery method of the coures
    enum DeliveryMethod{
        onCampus,
        online,
        blendedLearing
    }

    // struct containing the information of the courses offered at this department
    struct Course {
        address courseAddress;
        string name;
        Department department;
        uint8 credits;
        bool isActive;
        bool inPersonLearning;
        DeliveryMethod deliveryMethod;
    }

    struct Enrollment {
        address course;
        uint256 courseInstanceId;
        bool completed;
    }

    struct Department {
        string name;
        string category;

    }

    // NEED TO CREATE THE TOKEN OF THIS CONTRACT
    mapping(address => Course) public courses;


    mapping(address => Enrollment[]) public studentEnrollments;

    event CourseAdded(address courseAddress, string name, uint8 credits);
    event StudentEnrolled(address student, address courseAddress, uint256 courseInstanceId);
    event CreditsIssued(address student, address courseAddress, uint256 courseInstanceId, uint8 credits);

    constructor(address _controllerAddress) {
        controllerAddress = _controllerAddress;
        controller = EducationalInstitutionController(controllerAddress);
    }

    modifier onlyRegisteredInstitution() {
        require(controller.isRegistered(address(this)), "Institution is not registered");
        _;
    }

// function will deploy new token contract to represent the course
    function addCourse() public onlyRegisteredInstitution {
    }

    function enrollStudent() public onlyRegisteredInstitution {
    }

// function will issue the token contract to verified student addresses once confirmation of completion issued from institution
    function issueCredits() public onlyRegisteredInstitution {
        
    }

}
