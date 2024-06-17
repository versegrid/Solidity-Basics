// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.

//     storage - variable is a state variable (store on blockchain)
//             - is a permanent variable storage that can be modified
//            - struct, mapping & array are need to be storage 

//     memory - is temporary variable storage that that can be modified
//            - variable is in memory and it exists while a function is being called
//            - struct, mapping & array are need to be memory 

//     calldata - is temporary variable storage that that can't be modified 
//              - special data location that contains function arguments

contract DataLocations {
    // Storage (persistent)
    uint256 public storedNum = 10;

    // Function to modify storage
    function incrementStoredNum() public {
        storedNum += 1;
    }

    // Memory (temporary)
    function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b;
        return sum;
    }

    // Calldata (function arguments)
    function transfer(address recipient, uint256 amount) public {
        // (Functionality for transferring funds omitted for simplicity)
    }

    // Storage (mapping example)
    mapping(uint256 => string) public names; // Mapping to store names with IDs as keys

    event NameStored(uint256 indexed id, string name);
    // Function to store a name in storage
    function storeName(uint256 id, string memory name) public {
        names[id] = name; // Storing name in storage using an ID as a key
        emit NameStored(id, name);
    }

    // Function to retrieve a name from storage
    function retrieveName(uint256 id) public view returns (string memory) {
        return names[id]; // Retrieving name from storage using the ID as a key
    }
}




contract DataLocationsWithStruct {

  // Storage (persistent)
  struct Person {
    string name;
    uint256 age;
  }
  mapping(uint256 => Person) public people; // Mapping for storing Person structs

  // Function to store a person in storage
  function storePerson(uint256 id, string memory name, uint256 age) public {
    people[id] = Person(name, age); // Creating and storing Person struct in storage
  }

  // Memory (temporary)
  function getPersonDetails(uint256 id) public view returns (string memory, uint256) {
    Person memory person = people[id]; // Retrieving Person struct from storage into memory
    return (person.name, person.age); // Returning name and age from memory
  }

  // Calldata (function arguments)
  function updateAge(uint256 id, uint256 newAge) public {
    // Cannot directly modify storage from calldata, but can access and potentially use elsewhere
  }
}
