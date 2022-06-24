//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract StructEnum {

    Order[] public orders;
    address public owner;
    uint256 public transactionCount;
    event OrderCreated(uint256 _orderId, address indexed _consumer);
    event ZipChanged(uint256 _orderId, string _zipCode);

    constructor() {
        owner = msg.sender;
    }

    enum Status {
        TAKEN,
        PREPARING,
        BOXED,
        SHIPPED
    }

    struct Order {
        address customer;
        string zipCode;
        uint256[] products;
        Status status;
    }

    function createOrder(string memory _zipCode, uint256[] memory _products) checkProducts(_products) increaseTransaction external returns(uint256) {
        // require(_products.length > 0, "No products.");

        // 1. YONTEM
        // Order memory order;
        // order.customer = msg.sender;
        // order.zipCode = _zipCode;
        // order.products = _products;
        // order.status = Status.TAKEN;
        // orders.push(order);

        // 2. YONTEM
        // orders.push(
        //     Order({
        //         customer: msg.sender,
        //         zipCode: _zipCode,
        //         products: _products,
        //         status: Status.TAKEN
        //     })
        // );

        // 3. YONTEM
        orders.push(Order(
            msg.sender,
            _zipCode,
            _products,
            Status.TAKEN
        ));

        emit OrderCreated(orders.length - 1, msg.sender);

        return orders.length - 1;
    }

    function advanceOrder(uint256 _orderId) checkOrderId(_orderId) onlyOwner external {
        // require(owner == msg.sender, "You are not authorized.");
        // require(orders.length > _orderId, "Not a valid order id.");

        Order storage order = orders[_orderId];
        require(order.status != Status.SHIPPED, "Order is already shipped.");

        if(order.status == Status.TAKEN){
            order.status = Status.PREPARING;
        } else if(order.status == Status.PREPARING) {
            order.status = Status.BOXED;
        } else if(order.status == Status.BOXED) {
            order.status = Status.SHIPPED;
        }        
    }

    function getOrder(uint256 _orderId) checkOrderId(_orderId) external view returns(Order memory) {
        // require(orders.length > _orderId, "Not a valid order id.");

        return orders[_orderId];
    }

    function updateZip(uint256 _orderId, string memory _zipCode) checkOrderId(_orderId) onlyCustomer(_orderId) increaseTransaction   external {
        // require(orders.length > _orderId, "Not a valid order id.");        

        Order storage order = orders[_orderId];   
        // require(order.customer == msg.sender, "You are not the owner.");
        order.zipCode = _zipCode;

        emit ZipChanged(_orderId, _zipCode);
    }



    modifier checkProducts(uint256[] memory _products) {
        require(_products.length > 0, "No products.");
        _;
    }

    modifier checkOrderId(uint256 _orderId) {
        require(orders.length > _orderId, "Not a valid order id.");
        _;
    }

    modifier increaseTransaction {
        _;
        transactionCount++;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "You are not authorized.");
        _;
    }

    modifier onlyCustomer(uint256 _orderId) {
        require(orders[_orderId].customer == msg.sender, "You are not the owner.");
        _;
    }

    
}