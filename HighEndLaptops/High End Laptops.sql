CREATE DATABASE laptop_list;

USE laptop_list;

CREATE TABLE SSDs(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
price INT,
speed INT,
storagecapacity INT,
PRIMARY KEY (id)

);
/* SSD information aquired from the top ranked section of searches for SSDs on Amazon.com 
(https://www.amazon.com/s?rh=n%3A1292116011%2Cp_72%3A4-&pd_rd_r=0b729a94-e358-4456-b2cc-c
67b94df69e0&pd_rd_w=vtj4N&pd_rd_wg=fuz44&pf_rd_p=a304ecd4-a57b-4669-aaa3-36ed2882b274&pf_
rd_r=JHZEDN1C321DGVY1N52K&ref=Oct_otopr_S)*/
INSERT INTO SSDs (name, price, speed, storagecapacity)
VALUES ('SAMSUNG (MZ-V8V1T0B/AM) 980 SSD 1TB - M.2 NVMe Interface Internal Solid State Drive with V-NAND Technology', 119.99, 3500, 1),
	   ('SAMSUNG 870 EVO 1TB 2.5 Inch SATA III Internal SSD (MZ-77E1T0B/AM)', 169.99, 560, 1),
	   ('SAMSUNG (MZ-V7S1T0B/AM) 970 EVO Plus SSD 1TB - M.2 NVMe Interface Internal Solid State Drive with V-NAND Technology', 149.90, 3500, 1),
       ('SAMSUNG 870 QVO SATA III 2.5" SSD 1TB (MZ-77Q1T0B)', 99.99, 6000, 1),
       ('SAMSUNG 980 PRO 1TB PCIe NVMe Gen4 Internal Gaming SSD M.2 (MZ-V8P1T0B)', 199.99, 7000, 1),
       ('Western Digital 1TB WD Blue SN550 NVMe Internal SSD - Gen3 x4 PCIe 8Gb/s, M.2 2280, 3D NAND, Up to 2,400 MB/s - WDS100T2B0C', 109.99, 8000, 1),
       ('Kingston 240GB A400 SATA 3 2.5" Internal SSD SA400S37/240G - HDD Replacement for Increase Performance', 34.99, 350, 0.24),
       ('Crucial MX500 1TB 3D NAND SATA 2.5 Inch Internal SSD, up to 560MB/s - CT1000MX500SSD1', 89.99, 6000, 1),
       ('SK hynix Gold S31 SATA Gen3 2.5 inch Internal SSD | SSD 500GB | 500GB SATA | Up to 560MB/S | Solid State Drive | Compact 2.5', 48.44, 6000, 0.5),
       ('Western Digital 1TB WD Green Internal PC SSD Solid State Drive - SATA III 6 Gb/s, 2.5"/7mm, Up to 550 MB/s - WDS100T2G0A', 89.99, 6000, 1),
       ('Samsung 860 EVO 500GB 2.5 Inch SATA III Internal SSD (MZ-76E500B/AM)', 73.99, 6000, 0.5),
       ('SK hynix Gold P31 PCIe NVMe Gen3 M.2 2280 Internal SSD', 134.99, 3500, 1),
       ('TEAMGROUP AX2 1TB 3D NAND TLC 2.5 Inch SATA III Internal Solid State Drive SSD', 79.99, 540, 1),
       ('Crucial P2 500GB 3D NAND NVMe PCIe M.2 SSD Up to 2400MB/s - CT500P2SSD8', 54.99, 6000, 0.5),
       ('SP 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5"', 31.99, 6000, 0.256),
       ('WD_BLACK 1TB SN750 NVMe Internal Gaming SSD Solid State Drive', 141.88, 3430, 1),
       ('Crucial BX500 1TB 3D NAND SATA 2.5-Inch Internal SSD, up to 540MB/s - CT1000BX500SSD1', 92.99, 6000, 1),
       ('SP 512GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5" 7mm (0.28")', 51.99, 6000, 0.512),
       ('PNY CS900 240GB 3D NAND 2.5" SATA III Internal Solid State Drive (SSD) - (SSD7CS900-240-RB)', 31.99, 6000, 0.240),
       ('Inland Platinum 2TB SSD NVMe PCIe Gen 3.0x4 M.2 2280 3D NAND Internal Solid State Drive', 199.99, 3400, 2);
       

/*This Code returns a table containing the information of two. The laptops table which holds the 
information of different kinds of laptops as well as the SSD table which holds the informaion
of different kinds of SSDs or Solid State Drives. The table is orgaized by the Ram column from greatest
to lowest value.*/
ALTER TABLE SSDs ORDER BY speed;
select *
  from SSDs order by speed;


You can do an implicit JOIN in the following way:

SELECT * 
FROM laptops l
JOIN SSDs s
ORDER BY l.Ram, s.speed;

select *
  from laptops, SSDs
 order 
    by case when Ram like '%GB' then power(1024, 3) * substr(Ram, 1, length(Ram) - 2) 
        end desc;


