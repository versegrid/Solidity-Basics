// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract IfElse {
    function foo(uint256 x) public pure returns (string memory) {
        if (x < 10) {
            string memory alert = "less than 10";
            return alert;
        } else if (x > 10) {
            string memory alert = "grater than 10";
            return alert;
        } else {
            string memory alert = "equal to 10";
            return alert;
        }
    }

    function ternary(uint256 _x) public pure returns (string memory) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        // the "?" operator is called the ternary operator
        return _x <= 10 ? "Less or equal to 10" : "Grater or equal to 10";
    }
}
