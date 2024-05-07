-- group by
-- 같은 값을 묶을때 사용하는 키워드이다

select
	category_code,
	count(*)
  from tbl_menu
 group by category_code ;
 
select
	category_code,
	sum(menu_price)
  from tbl_menu
 group by category_code;
 
select
	concat(menu_price)
  from tbl_menu;
  
 select 
 	category_code,
 	avg(menu_price)
   from tbl_menu
  group by category_code ;
  
 -- 그룹의 조건을 여러개 두고 값을 묶는 경우
 select 
 	category_code,
 	menu_price,
 	count(*)
   from tbl_menu
  group by category_code, menu_price;
  
 -- 그룹에 조건을 부여하기
 -- having
 select 
 	category_code
   from tbl_menu
   where category_code > 6 -- sql 쿼리의 전체에 대한 조건
  group by category_code 
  having category_code between 5 and 8; -- 그룹 집합에 대한 조건 -- 날짜 데이터조회할때 between 많이 씀 
  
 select 
 *
 from TBL_MENU;
 
select 
CATEGORY_CODE,
CATEGORY_NAME,
menu_name ,
menu_price 
from TBL_MENU
where CATEGORY_CODE = 8
join tbl_category (CATEGORY_NAME = CATEGORY_CODE);
