pragma solidity ^0.4.10;

contract manuf{
    
    struct Product_info{
        string product_name;
        string product_manu;
        string product_expiry;
        uint product_price;
        uint product_uid;
    }

    mapping (uint => Product_info) All_products;

    function set(uint id, string name, string manu, string expiry, uint price, uint uid) public {
    
        All_products[id].product_name = name;
        All_products[id].product_manu = manu;
        All_products[id].product_expiry = expiry;
        All_products[id].product_price = price;
        All_products[id].product_uid = uid;
    }
    

    function get(uint id) public view returns (string, string, string, uint) {
        return (All_products[id].product_name, All_products[id].product_manu, All_products[id].product_expiry, All_products[id].product_price);
    }

    function get_name(uint id) external view returns (string) {
        return(All_products[id].product_name);
    }

    function get_manu(uint id) external view returns (string) {
        return(All_products[id].product_manu);
    }

    function get_expiry(uint id) external view returns (string) {
        return(All_products[id].product_expiry);
    }

    function get_price(uint id) external view returns (uint) {
        return(All_products[id].product_price);
    }

    function get_uid(uint id) external view returns (uint) {
        return(All_products[id].product_uid);
    }
    
}

contract user {
    
    
    string Product_name;
    string Product_manu;
    string Product_expiry;
    uint Product_price;
    uint Product_id;
    uint Product_uid;
    

    address address_manuf;

    function set_address(address a) external {
        address_manuf = a;
    }

    function user_set(uint id) external {  //set values from blockchain

        manuf cont1 = manuf(address_manuf);
        Product_name = cont1.get_name(id);
        Product_manu = cont1.get_manu(id);
        Product_expiry = cont1.get_expiry(id);
        Product_price = cont1.get_price(id);
        Product_uid = cont1.get_uid(id);
        Product_id = id;

    }

    function user_get ( uint uid, uint id) external view returns (string, string, string, string) { // get values from qr
        //keccak256(abi.encodePacked('Product_name')) == keccak256(abi.encodePacked(name))
        if(Product_uid==uid && Product_id==id) {
            return ("Genuine product", Product_name, Product_manu, Product_expiry);
        }
        else{
            return("Fake product", Product_name, Product_manu, Product_expiry);
        }
    }
}