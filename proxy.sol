pragma solidity >=0.6.0;


contract Bank {
    uint public totalDeposit;
    address public _eth;
    address payable public _owner;
    event Received(address, uint);
    event PrintLog(address target,bytes payload,uint val,uint gas);
    constructor(address eth) public {
        _owner = payable(msg.sender);
        _eth = eth;
    }
    
    function call_proxy(address payable target, bytes memory payload1, uint value, uint gas) public payable {
        address[] memory markets = new address[](1);
        markets[0] = address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bytes memory payload = abi.encodeWithSignature("getPath(address[])", markets);
        emit PrintLog(target,payload,value,gas);
        (bool success, bytes memory returnData) = target.call{value: value, gas: gas}(
            payload
        );
        require(success);
    }
            // abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
    function testCallFoo(address payable _addr, bytes memory payload) public payable {
        // You can send ether and specify a custom gas amount
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(
            payload
        );
        require(success);
    }

    
}