/* DML(data manipulation language)*/

-- INSERT, UPDATE, DELETE, SELECT(DQL)
-- : 데이터 조작 언어, 테이블에 값을 삽입하거나, 수정하거나
-- 삭제하거나, 조회하는 언어

-- INSERT
-- 새로운 행을 추가하는 구문이다.
-- 테이블 행의 수가 증가한다.
insert into TBL_MENU VALUES(null, '바나나해장국', 8500, 4, 'Y'); --null 이라고 쓰면 알아서 값을 치환해서 테이블에 넣어준다.

insert into tbl_menu
	(
		MENU_NAME, MENU_PRICE, CATEGORY_CODE, orderable_status 
	)VALUES(
		'초콜릿죽', 6000, 7, 'Y'
	);

-- 등록하는 컬럼의 순서는 상관 없다.
-- 단 컬럼의 순서에 맞는 값을 매칭해야 한다.

insert into tbl_menu
	(
		MENU_NAME, orderable_status  , CATEGORY_CODE, MENU_PRICE
	)VALUES(
		'빽사이즈 아메리카노', 'Y', 7, 3000
	);
	
select * from TBL_MENU;

-- MULTI INSERT
insert into TBL_MENU 
	VALUES(null, '바나나해장국', 8500, 4, 'Y'),
		  (null, '뼈다귀 해장국', 8500, 4, 'Y'),
		  (null, '왕뚝배기 해장국', 8500, 4, 'Y');
		  
select * from TBL_MENU;

-- UPDATE
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.

select 
	MENU_CODE,
	CATEGORY_CODE
  from tbl_menu
  where MENU_NAME = "바나나해장국";
  
 update tbl_menu
 	set MENU_NAME = "바나나 탕후루"
  where MENU_CODE = 22;
  
-- 가상의 VIEW를 형성해서 조회
-- MYSQL은 ORACLE과 달리 UPDATE나 DELETE 시 자기 자신 테이블의 데이터를 사용하면 1093에러가 발생한다.
  update tbl_menu
 	set CATEGORY_CODE = "6"
  where MENU_CODE = (select
  						TMP.menu_code
  					  from (
  					  	select
  					  		menu_code 
  					  	  from tbl_menu
  					  	  where MENU_NAME = "바나나 탕후루"
  					  ) as TMP
  				     );
 
  				    
-- DELETE
delete from tbl_menu 
 order by MENU_PRICE DESC
 limit 2;
 
select *
  from TBL_MENU
 order by MENU_PRICE DESC;

delete from tbl_menu 
 where menu_price = 8500;


-- replace
-- insert 시 primary key 또는 unique key가 충돌이 발생할 수 있다면
-- replace를 통해 중복된 데이터를 덮어 쓸 수 있다.
replace into tbl_menu values (12, '참기름라떼', 5000, 10, 'Y');
insert into tbl_menu values (12, '참기름라떼', 5000, 10, 'Y');

select * from tbl_menu;

 