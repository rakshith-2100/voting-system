pragma solidity ^0.8.15;

contract Voting{
    struct Candidate {
        uint id;
        string name;
        uint votecount;
    }
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public count;
     function newCandidate (string memory _name) private {
         count ++;
         candidates[count] = Candidate(count, _name,0);

     }
     constructor () public {
         newCandidate("candidat1");
         newCandidate("candidat2");
         newCandidate("candidat3");
         newCandidate("candidat4");
         newCandidate("candidat5");
     }
     function vote (uint _candidateId) public {
         require(voters[msg.sender]);
         require(_candidateId > 0 && _candidateId <= count);
         voters[msg.sender] = false;
         candidates[_candidateId].votecount ++;
     }
}