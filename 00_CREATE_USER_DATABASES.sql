-- 관리자 계정으로 사용이 가능한 구문
-- use mysql;

-- gangnam 데이터베이스를 만든다.
-- create database gangnam;

-- 새로운 계정 만들기
-- create user 'gangnam'@'%' identified by 'gangnam';

-- 데이터 베이스 목록보기
show databases;

-- mysql 데이터베이스 사용하기
-- use mysql;

-- 현재 접속한 데이터베이스의 테이블에 목록을 확인한다.
show tables;

-- user 테이블의 모든 컬럼을 조회한다.
select * from user;



-- gangnam 데이터베이스에 gangnam 계정에서 privileges 권한을 부여하여 사용할 수 있도록 함
-- 계정에 권한을 주겠다는 명령어. privileges는 권한 묶음이고 gangnam. * 은 모든권한을 주겠다는 뜻이고 %는 아무나 접근가능.
-- grant all privileges on gangnam. * to 'gangnam'@'%';


use mysql;
create user 'number'@'%' identified by 'number';
create database number;

grant all privileges on number. * to 'number'@'%';
show databases;
-- drop database number; 데이터베이스 삭제
-- delete from mysql.user where User ='number'; 사용자와 관련된 모든 정보 삭제
-- delete from mysql.db where User ='number'; 사용자가 접근할 수 있는 데이터베이스 권한 삭제
-- flush privileges; 변경된 권한 설정 즉시 적용

use mysql;
create user 'phone_book'@'%' identified by 'phone_book';
create database phone_book;
grant all privileges on phone_book. * to 'phone_book'@'%';
