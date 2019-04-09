create table [TB_USERS]

(
	id_usr int IDENTITY(1,1) PRIMARY KEY,
	nm_lgnusr varchar(20) not null,
	ds_pwdusr varchar(50) not null,
	nm_usr	varchar(50) not null,
	fl_atv char(1) not null,
	dt_icl datetime not null,
	dt_denurs datetime null
)
;

create table [TB_CATEGORIES] 

(
	id_cat int IDENTITY(1,1) PRIMARY KEY,
	nm_cat varchar(50) not null,
	ds_imgcat varbinary(max) not null,
	fl_atv char(1) not null,
	dt_icl datetime not null,
	cd_usricl int not null,
	dt_dencat datetime null,
	cd_usrden int not null
)

create table [TB_NEWS]

(
	id_new int IDENTITY(1,1) PRIMARY KEY,
	nm_new varchar(70) not null,
	ds_txtnew varchar(max) not null,
	ds_urlnew varchar(200) not null,
	dt_new datetime not null,
	dt_icl datetime not null,
	cd_usricl int not null,
	dt_alt datetime null,
	cd_usralt int null
)


ALTER TABLE TB_NEWS
    ADD id_cat INTEGER,
    FOREIGN KEY(id_cat) REFERENCES TB_CATEGORIES(id_cat);