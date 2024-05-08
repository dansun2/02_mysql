-- 테이블 생성
-- category 테이블 생성
CREATE TABLE IF NOT EXISTS tbl_category
(
    category_code    INT AUTO_INCREMENT COMMENT '카테고리코드',
    category_name    VARCHAR(30) NOT NULL COMMENT '카테고리명',
    ref_category_code    INT COMMENT '상위카테고리코드',
    CONSTRAINT pk_category_code PRIMARY KEY (category_code),
    CONSTRAINT fk_ref_category_code FOREIGN KEY (ref_category_code) REFERENCES tbl_category (category_code)
) ENGINE=INNODB COMMENT '카테고리';

create table if not exists user_info
(
	user_code int auto_increment comment '회원 코드',
	user_name varchar(255) not null comment '회원 이름',
	user_email varchar(255) comment '이메일',
	user_memo varchar(255) comment '메모',
	user_group varchar(255) comment '그룹',
	constraint pk_user_code primary key(user_code) -- user_info 테이블에서 user_code열을 주 키로 설정하여 각 회원을 고유하게 식별한다.
)engine = innodb comment '회원정보'; -- 데이터베이스의 엔진을 innodb로 만들어 테이블에 대한 주석을 전화번호 코드로 설정

create table if not exists phone_info
(
	phone_code int auto_increment primary key comment '전화번호코드',
	user_code int not null comment '회원코드',
	phone varchar(255) comment '전화번호',
	phone_name varchar(255) comment '전화번호 이름',
	constraint fk_user_code foreign key(user_code) references user_info(user_code)
)engine = innodb comment '전화번호 코드';

select * from user_info;
select * from phone_info;

describe user_info;
describe phone_info;