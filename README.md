# Fake-product-Identification-over-Blockchain

This project is for identifying fake products over a blockchain network.

# Contracts.

1. Manufacturer - After manufacturing a certain product the manufacturer will add the product details in the network. These details will be transacted to a block.
                  All the details are stored in a structure which is mapped using the product ID.
                  
2. User -         The user can input the details on the product and these will be verified with the data entered by the manufacturer. If it is incorrext, the product is                   fake.


# How to run - 

Preferably set your compiler to version 0.4.26+commit.5463c3fc to avoid any errors

Deploy both the contracts.

Add the product details in the manufacturer contract through the set method.

Copy the address of the manufacturer address and set it in the user contract in the set_address() method.

Enter the product ID in the user_get method to fetch details from the manufacturer.

Enter ID, UID and expiry in the user_set mehod to check whether the product is fake or not.


# Results

![image](https://user-images.githubusercontent.com/94474290/205031603-fb440171-2349-4a0b-bc41-d74615f91856.png)                                   ![image](https://user-images.githubusercontent.com/94474290/205031951-e329f0c9-e80b-4d6e-b50f-710d944b6d29.png)

