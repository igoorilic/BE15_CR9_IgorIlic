Query:
1:
SELECT * from account;
SELECT * from products;

2:
SELECT username
FROM account
WHERE username like "j%"

3:
SELECT orderId
FROM `order`
WHERE orderDate between "
2022.03.01" and "2022.03.02
";

Joins:
4:
SELECT products.productName, products.brand, company.companyName
FROM products
JOIN company on productId = fk_productId;

5:
select famazon.fk_customerId, invoice.price
from famazon
join products on products.productId = famazon.fk_productId
JOIN company on products.productId = company.fk_productId
JOIN `order` on company.companyId = `order`.fk_companyId
JOIN invoice on `order`.orderId = invoice.fk_orderId;

6:
SELECT customer.fName, customer.lName, products.productName
from customer
JOIN famazon on customer.customerId = famazon.fk_customerId
JOIN products on products.productId = famazon.fk_productId;


Bonus:
1:
SELECT customer.fName, famazon.fk_customerId, products.productName, company.companyName
FROM customer
JOIN famazon on customer.customerId = famazon.fk_customerId
JOIN products on products.productId = famazon.fk_productId
JOIN company on products.productId = company.fk_productId;

2:
SELECT paymentMethod.paymentMethod, account.username, customer.fk_shippingId, shipping.deliveryTime, shippingDetails.shippingDate, shippingDetails.shippingMethod
from paymentMethod
JOIN account on account.accountId = paymentMethod.fk_accountId
JOIN customer on customer.customerId = account.fk_customerId
JOIN shipping on shipping.shippingId = customer.fk_shippingId
JOIN shippingDetails on shipping.shippingId = shippingDetails.fk_shippingId;