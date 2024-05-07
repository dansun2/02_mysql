/* 서브쿼리 */

select
	CATEGORY_CODE
  from tbl_menu
 where MENU_NAME = '우럭스무디';
 
select 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE,
	CATEGORY_CODE,
	ORDERABLE_STATUS
  from TBL_MENU
 where CATEGORY_CODE in (select
 							CATEGORY_CODE,
 							from tbl_menu
 							where MENU_NAME = '우럭스무디');
 							
-- FROM 절에 쓰인 서브쿼리
select
	MAX(COUNT)
  FROM(
  	select
  		COUNT(*) as 'COUNT' -- from절을 썼을때는 별칭을 무조건 줘야함
  	  from tbl_menu
  	 group by category_code
  ) as countmenu; 

-- 카테고리별 평균 가격보다 높은 가격의 메뉴 조회
select 	
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  from tbl_menu a
  where menu_price > (select
  						avg(menu_price)
  					   from tbl_menu
  					   where category_code = a.category_code);
 
 
 /* EXIXTS */
 -- 조회 결과가 있을 때 TRUE 아니면 FALSE
 select 
 	category_name
   from tbl_category a
  where exists (
  		select 
  			1
  		from tbl_menu b
  	   where b.category_code = a.category_code
  	   );