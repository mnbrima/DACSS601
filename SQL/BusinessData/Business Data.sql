/*The datasets that are used in this analysis come from
https://www.kaggle.com/mkechinov/ecommerce-behavior-data-from-multi-category-store?select=2019-Nov.csv.
They represent ecommerce data of a large multiple category online store as it shows the relations of the 
site's users to the products held on the site that users observe. The data tables used feature the 
ecommerce data of the site in October 2019 and November 2019 with both months represeted as thir own 
separate data tables. The datasets make up for 13 GB (or gigabytes), between them as they hold 285 million 
entrys of user-product event data that occured on the ecommerce site within the two time frames.
The purpose of using these data sets is to identify which products of a specific category are of 
the lowest prices when comparing different brands of products.*/

/*Creates the database that will store the datatbles to be used.*/
CREATE DATABASE business_data;

/*The code below allows the schema 'business_data' to be used 
which can be used to store different tables of data.*/
USE business_data;
/*Allows the data from the oct2019 data table to be viewed*/
SELECT * FROM oct2019_data; 

/*Allows the data from the nov2019 data table to be viewed*/
SELECT * FROM nov2019_data;

/*The following code shows the october 2019 data left joined with the nov 2019 
data pertaining to the specific brand, 'aqua'.*/

SELECT * FROM oct2019_data
LEFT JOIN nov2019_data ON oct2019_data.category_id = nov2019_data.category_id
HAVING oct2019_data.BRAND = 'aqua';

/*The following code shows the october 2019 data left joined with the nov 2019 
data pertaining to the specific brand, 'lenovo'.*/

SELECT * FROM oct2019_data
LEFT JOIN nov2019_data ON oct2019_data.category_id = nov2019_data.category_id
HAVING oct2019_data.BRAND = 'lenovo';            
             
/*The following code finds the lowest price of a product of a certain category 
(for this instance, smartphones in electronics 'electronics.smartphone') for each brand that holds the 
product category within the period of October 2019 (using the 'oct2019_data' dataset).*/
             
SELECT
	brand,
	MIN(price),
    category_code
FROM
oct2019_data	
GROUP BY
	brand
    HAVING category_code = 'electronics.smartphone' ;
    
/*The following code finds the lowest price of a product of a certain category 
(for this instance, smartphones in electronics 'electronics.smartphone') for each brand that holds the 
product category within the period of November 2019 (using the 'nov2019_data' dataset).*/

SELECT
	brand,
	MIN(price),
    category_code
FROM
nov2019_data	
GROUP BY
	brand
    HAVING category_code = 'electronics.smartphone' ; 
    
    
