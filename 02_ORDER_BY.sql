select
	menu_code ,
	menu_name ,
	menu_price
  from tbl_menu
  
-- 정렬을 해주는데 위에 셀렉트에서 선택된 것들 기준으로만 가능
-- order by menu_price asc; -- asc : 오름차순 정렬, desc : 내림차순 정렬

order by menu_price desc;

select
	menu_code ,
	menu_name ,
	menu_price * menu_code 
  from tbl_menu
 order by
  	menu_price desc ,
  	menu_name asc;
  
  -- 메뉴의 코드,이름,메뉴코드*가격을 조회한다.
  -- 정렬 기준은 코드의 오름차순으로 정렬해주세요.
  
  select
  	menu_code ,
  	menu_name ,
  	menu_price * menu_code
   from tbl_menu
   
order by menu_code asc;


-- 치환
select
	field('C', 'A', 'B', 'C');

select field(orderable_status, 'N','Y') -- N이면 1번 Y이면 2번을 주는것. 인덱스를 기준으로 값을 매겨서 정렬할때 사용함
  from tbl_menu;
 
select
	category_code ,
	category_name ,
	ref_category_code 
  from tbl_category
 order by ref_category_code is null desc ;
 
  	
  