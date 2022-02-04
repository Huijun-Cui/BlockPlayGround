
contract Test1 {
    event TestLog(uint ret);
    event FooLog(string message,uint x);
    function Test(uint a, uint b) public payable returns(uint) {
        emit TestLog(a + b);
        return a + b;
    }
    function foo(string memory _message, uint _x) public payable returns (uint,uint) {
        emit FooLog(_message, _x);
        return (_x + 1,_x + 2);
    }
    function swapExactETHForTokens(uint amountOutMin, address to, uint deadline)
        external
        virtual
        payable
        returns (uint)
    {
        return deadline;
    }
    function getPath(address[] memory path) public payable returns(bool) {
        return true;
    }
}

