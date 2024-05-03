-- LIMIT
-- 출력하는 수의 제한을 둔다.

select
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
  from tbl_menu
 order by MENU_PRICE;



-- 가격이 가장 높은 행 3개 조회
select
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
  from tbl_menu
 order by MENU_PRICE desc
 limit 3;



-- 2번 행부터 5번 행까지 조회
select
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
  from tbl_menu
 order by MENU_CODE
 limit 3, 5; -- 3번까지는 제외하고 그 다음부터 5개
 
 
 
 -- 상위 다섯줄의 행만 조회
SELECT 
    menu_code,
    menu_name,
    menu_price
  from tbl_menu
 ORDER by menu_price DESC, menu_name ASC
LIMIT 5; -- 여기서 0이 생략됨 limit 0,5;