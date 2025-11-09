select *
from train;

-- Checking Null Values on Important column To remove unwanted datas
select *
from train
where 'Order ID' is null
or 'Order Date'is null
or 'Customer ID' is null;

select *
from train
where  `Postal Code` is null
or `Ship Mode` is null;

-- Creating new table so i can remove unwanted datas or modify datas
create table train_1
like train;

select *
from train_1;


insert train_1
select *
from train;
-- Deleting Duplicates datas
delete t1
from train_1 t1
join(
select `Row ID`
from(
select `Row ID`,
row_number() over(
partition by  `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`,
			`Customer ID`, `Customer Name`, `Segment`, `Country`,
			`City`, `State`, `Postal Code`
		order by `Row ID`
        ) as rn
from train_1
)x
where rn>1
)dup
on t1.`Row ID`= dup.`Row ID`;

select * 
from train_1;
-- checking any odd typos for standarizing the value
select distinct `city` from train_1 order by `city`;

select distinct `Country` from train_1 order by `Country`;

select distinct `Segment` from train_1 order by `Segment`;

select distinct `State` from train_1 order by `State`;

select distinct `Ship Mode` from train_1 order by `Ship Mode`;

select distinct `Region` from train_1 order by `Region`;

select distinct `category` from train_1 order by `Category`;

select distinct `Sub-Category` from train_1 order by `Sub-Category`;

-- Removing any white spaces
UPDATE train_1 SET
`Order ID`= TRIM(`Order ID`),
`Ship Mode`= TRIM(`Ship Mode`),
`Customer ID`= TRIM(`Customer ID`),
`Customer Name` = TRIM(`Customer Name`),
`Segment` = TRIM(`Segment`),
`Country`= TRIM(`Country`),
`City` = TRIM(`City`),
`State` = TRIM(`State`),
`Order Date`= Trim(`Order Date`);

  
  -- Fixing Data Types
  
  describe train_1;
  
update train_1
set `Order Date`= STR_TO_DATE(TRIM(`Order Date`), '%d/%m/%Y');

update train_1
set `Ship Date`= STR_TO_DATE(TRIM(`Ship Date`), '%d/%m/%Y');

alter table train_1
modify column `Order Date` date;

alter table train_1
modify column `Ship Date` date;

select*
from train_1;


-- Checking outlier

select min(Sales),max(Sales),avg(Sales)
from train_1;

select min(`Order Date`),max(`Order Date`)
from train_1;


-- Explotary Data Analysis

select * 
from train_1;

select count(*) as total_rows
from train_1;

select distinct Segment
from train_1;

select distinct Category
from train_1;

select distinct `Sub-Category`
from train_1;

select `Category`, count(*) as num_orders
from train_1
group by `Category`
order by num_orders desc;

-- office supplies has more orders


select `Sub-Category`, count(*) as num_orders
from train_1
group by `Sub-Category`
order by `Sub-Category`;


select Year(`Order Date`) as "year", Month(`Order Date`) as "Month", count(*) as order_count
from train_1
group by year,Month
order by year Desc,month desc;


select Year(`Order Date`) as "year", Month(`Order Date`) as "Month", count(*) as order_count
from train_1
group by year,Month
order by order_count desc;

select year(`Order Date`) as "Year" , count(*) as order_count
from train_1
group by Year
order by order_count desc;

-- 2017 had most orders comparted to rest 3 years


select `Customer Name`, sum(`Sales`) as total_sales
from train_1
group by `Customer Name`
order by total_sales desc
limit 10;

-- Top Ten Customer

select min(`Sales`),max(`Sales`),avg(`Sales`),stddev(`Sales`)
from train_1;
-- sales are varying by so much
