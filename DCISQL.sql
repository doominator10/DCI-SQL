/* Qs:  --How many customers of each product are male/female?
        --Which products are most often sold to customers with an affiliate card?
        Is there any more information that can be gleaned from that information? 
*/

Select PROD_NAME AS Product_Name, count(CUST_GENDER) AS Male
FROM sh.sales s                                     --start with the product id and customer id  
LEFT JOIN sh.products p on p.PROD_ID = s.PROD_ID    --pull the product names out of the product table based on product id
LEFT JOIN sh.customers c on c.CUST_ID = s.CUST_ID   --pull customer gender out of customer table based on customer id
where c.CUST_GENDER = 'M'
group by PROD_NAME
order by Male asc;









/*
Select PROD_NAME AS Product_Name, count(CUST_GENDER) AS Female
FROM sh.sales s                                     --start with the product id and customer id  
LEFT JOIN sh.products p on p.PROD_ID = s.PROD_ID    --pull the product names out of the product table based on product id
LEFT JOIN sh.customers c on c.CUST_ID = s.CUST_ID   --pull customer gender out of customer table based on customer id
where c.CUST_GENDER = 'F'
group by PROD_NAME
order by Female asc;
*/







/*Select PROD_NAME AS Product_Name, count(AFFINITY_CARD) AS BOUGHT_BY_AFFINITY_HOLDERS
FROM sh.sales s                                     --start with the product id and customer id  
LEFT JOIN sh.products p on p.PROD_ID = s.PROD_ID    --pull the product names out of the product table based on product id
LEFT JOIN sh.supplementary_demographics sd on sd.CUST_ID = s.CUST_ID   --pull whether or not customer has affinity out of demographics table based on customer id
where sd.AFFINITY_CARD = 1
group by PROD_NAME
order by BOUGHT_BY_AFFINITY_HOLDERS desc;*/







/*
Select sum(AFFINITY_CARD) AS Affinity_Count
FROM sh.supplementary_demographics;

Select (trunc(sum(AFFINITY_CARD) / count(AFFINITY_CARD), 2)) AS Affinity_Percentage
FROM sh.supplementary_demographics;


Select PROD_NAME AS Product_Name, count(AFFINITY_CARD) AS BOUGHT_BY_AFFINITY_HOLDERS
FROM sh.sales s                                     --start with the product id and customer id  
LEFT JOIN sh.products p on p.PROD_ID = s.PROD_ID    --pull the product names out of the product table based on product id
LEFT JOIN sh.supplementary_demographics sd on sd.CUST_ID = s.CUST_ID   --pull whether or not customer has affinity out of demographics table based on customer id
where sd.AFFINITY_CARD = 0
group by PROD_NAME
order by BOUGHT_BY_AFFINITY_HOLDERS desc;
*/