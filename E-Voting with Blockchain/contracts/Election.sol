pragma solidity >=0.4.21 <0.7.0;

contract Election{

    struct Candidate{
        uint id;
        string name;
        uint votes;
    }

    mapping (uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public candidatesCount;

    constructor() public{
        addCandidate("Modi");
        addCandidate("Trump");
    }

    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    function vote(uint _candidateId) public{

        require(!voters[msg.sender], "Already voted!");

        require(_candidateId > 0 && _candidateId < candidatesCount, "Invalid choice!");

        voters[msg.sender] = true;
        candidates[_candidateId].votes ++; 
    }
}