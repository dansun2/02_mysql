-- <GROUP BY 카테고리 네임별로 총 메뉴의 평균값을 구하시오.>

-- 카테고리 이름, 메뉴 가격을 셀렉트한다.
-- 어디서 가져올지 적는다.(from)
-- 카테고리 이름이 메뉴테이블에 없기 때문에 조인을 시킨다
-- 같은지 비교해야 할 것은 메뉴 카테고리 코드랑 카테고리 카테고리 코드가 일치하는지(on)->그래야 카테고리 이름 출력 가능
-- 카테고리 이름의 평균값을 구하는게 문제기 때문에 그룹으로 카테이름 묶어줌
-- 평균값을 구한다 (avg) -> 근데 이 안에 메뉴가격에 들어가니까 셀렉트에서 또 써 줄 필요가 없음
select 
	c.category_name,
	avg(m.menu_price)
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
  group by c.category_name;
 
 
 
-- <JOIN 카테고리네임 중 '커피' 로 분류된 메뉴의 이름과 가격을 출력하시오.>
-- category_name, menu_name, price 가 출력되어야 함
 
-- 메뉴 이름, 메뉴 가격을 셀렉트한다.
-- 어디서 가져올지 (from) - tbl_menu
-- 카테고리 이름이 커피랑 일치하는지 봐야하니까 카테고리 테이블을 조인시켜야 함
-- where 을 써서 커피랑 일치하는 메뉴 확인
select 
	m.menu_name,
	m.menu_price,
	c.category_name
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
 where c.category_name = "커피";
 


-- <HAVING 가격이 12000원 이하인 음식들의 메뉴이름, 카테고리 이름과 가격을 내림차순으로 출력하시오.>

-- 메뉴 이름과 가격, 카테고리 이름을 셀렉트한다.
-- 어디서 가져올지 정한다.(from) - tbl_menu
-- 카테고리 이름을 출력해야 하기 때문에 menu테이블과 category테이블을 조인한다.(카테코드 일치하는지 확인)
-- having을 사용하여 가격이 12000원 이하라는 조건을 달아준다
-- order by로 내림차순 정렬
select 
	m.menu_name,
	m.menu_price,
	c.category_name
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
 having m.menu_price >= 12000
 order by m.menu_price desc;



-- <형석님 join> category_name, menu_name, menu_price를 출력
-- 카테네임, 메뉴네임, 메뉴가격 셀렉트
-- tbl_menu에서 from
-- 카테네임 출력을 위해 조인한다(카테코드 일치하는지 확인)
select
	category_name,
	menu_name,
	menu_price
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
 order by c.category_name asc, m.menu_name asc;



-- <형석님 group by> 각 category_name 별로 menu_price를 합산하고 합산 결과를 sum으로 변경 후 category_name, sum 출력
-- 카테네임, 메뉴가격 셀렉트
-- from tbl_menu
-- tbl_category랑 조인
-- sum으로 합계를 구함
select
	c.category_name,
	sum(m.menu_price)
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
 group by c.category_name;
 


-- <형석님 having> 위의 합산한 결과에서 10000원 이상인 카테고리만 출력
-- 카테네임, 메뉴가격 셀렉트
-- from tbl_menu
-- tbl_category랑 조인
-- sum으로 합계를 구함
-- having으로 price에서 10000원 이상만 출력
select
	c.category_name,
	sum(m.menu_price) as sum
  from tbl_menu m
  join tbl_category c on (m.category_code = c.category_code)
  group by c.category_name
  having sum >= 10000;
 
 
 
-- <승엽님 group by> 카테고리 코드와 메뉴 가격에 대한 합 카테고리 코드로 묶어주세요.
-- 카테코드랑 메뉴가격 셀렉트
-- from 에서 menu테이블 가져와서 category테이블이랑 조인 (코드값 같은지 확인)
-- sum으로 가격 총합을 구함
-- group by로 카테코드 grouping
 
select 
	c.category_code,
  	sum(m.menu_price)
  from tbl_menu m
  join tbl_category c on (c.category_code = m.category_code)
  group by c.category_code ;
 

 

-- <승엽님 JOIN> 메뉴 코드와 카테고리 코드를 연결시켜 출력
-- 카테코드, 메뉴코드 셀렉트
-- from 에서 menu테이블 가져와서 category테이블이랑 조인 (코드값 같은지 확인)
select
	c.category_code,
	m.menu_code
	from tbl_menu m
	join tbl_category c on (c.category_code = m.category_code);



-- <승엽님 HAVING> 카테고리 코드와 메뉴 가격의 평균을 가져와 카테고리 코드에 4~6까지 출력
-- 카테코드랑 메뉴가격 셀렉트
-- from 에서 menu테이블 가져와서 category테이블이랑 조인 (코드값 동일한지 확인)
-- avg로 menu_price의 평균을 가져옴
-- having써서 between으로 카테코드의 4~6까지 출력
select
	c.category_code,
	m.menu_price
  from tbl_menu m
  join tbl_category c on (c.category_code = m.category_code)
 having c.category_code between 4 and 6;


-- <화연님 join> 메뉴 테이블의 메뉴 이름과 카테고리 이름을 left join 하고 메뉴 테이블의 메뉴 가격을 오름차순으로 정렬하여 출력.
-- 출력 순서는 메뉴이름, 메뉴가격, 카테고리이름 순서이다.

-- 메뉴이름, 메뉴가격, 카테고리이름 셀렉트한다.
-- from에서 menu테이블 가져와서 category테이블이랑 left join 시킴
-- 메뉴가격을 오름차순 정렬한다.
select 
	m.menu_name,
	m.menu_price,
	c.category_name
  from tbl_menu m
  left join tbl_category c on (m.category_code = c.category_code)
  order by m.menu_price asc;
 
 
 
-- <화연님 group by> 카테고리 코드를 그룹으로 묶고 가격의 최댓값을 출력.
-- 카테코드, 메뉴가격 셀렉트
-- max로 가격의 최댓값 출력
select 
	category_code,
	max(menu_price)
	from tbl_menu
 group by category_code;



-- <화연님 having> 메뉴 이름과 주문상태(orderable status)를 그룹으로 묶고 메뉴이름과 주문상태가 Y인 것만 출력
-- 메뉴이름, status 셀렉
-- from으로 메뉴테이블 불러옴
-- orderable status 를 grouping
-- having으로 Y인것만 출력
select 
	menu_name,
	orderable_status 
  from tbl_menu
  group by menu_name, orderable_status 
  having orderable_status = "Y";
 
 
 
-- <은석님 join> right을 이용하여 메뉴 이름 및 코드를 출력하시오 
-- from menu테이블 불러줌
-- 메뉴이름, 코드 셀렉
-- 카테고리 테이블이랑 right join
select
	m.menu_name,
	c.category_code 
  from tbl_menu m
  right join tbl_category c on (m.category_code = c.category_code);
 
 
 
-- <은석님 group by> 카테고리 코드 및 메뉴 코드를 출력하시오
-- from으로 menu 테이블 불러줌
-- 카테고리 코드랑 메뉴코드 셀렉트
-- 둘다 그룹으로 묶음

select
	menu_code,
	category_code
  from tbl_menu
  group by category_code, menu_code;
 
 

-- <은석님 having> 이용하여 메뉴 이름 및 카운트를 하세요
-- from으로 menu테이블 불러줌
-- 메뉴이름 셀렉트
-- 카운팅
select 
	menu_name
  from tbl_menu
 group by menu_name
 having count(menu_name);


select ascii('A');

