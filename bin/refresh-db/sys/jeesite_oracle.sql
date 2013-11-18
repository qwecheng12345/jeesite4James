
/* Drop Indexes */

DROP INDEX sys_area_parent_id;
DROP INDEX sys_area_parent_ids;
DROP INDEX sys_area_del_flag;
DROP INDEX sys_dict_value;
DROP INDEX sys_dict_label;
DROP INDEX sys_dict_del_flag;
DROP INDEX sys_mdict_parent_id;
DROP INDEX sys_mdict_parent_ids;
DROP INDEX sys_mdict_del_flag;
DROP INDEX sys_menu_parent_id;
DROP INDEX sys_menu_parent_ids;
DROP INDEX sys_menu_del_flag;
DROP INDEX sys_office_parent_id;
DROP INDEX sys_office_parent_ids;
DROP INDEX sys_office_del_flag;
DROP INDEX sys_role_del_flag;
DROP INDEX sys_user_office_id;
DROP INDEX sys_user_login_name;
DROP INDEX sys_user_company_id;
DROP INDEX sys_user_update_date;
DROP INDEX sys_user_del_flag;



/* Drop Tables */

DROP TABLE sys_role_office;
DROP TABLE sys_user_role;
DROP TABLE sys_user;
DROP TABLE sys_office;
DROP TABLE sys_area;
DROP TABLE sys_dict;
DROP TABLE sys_mdict;
DROP TABLE sys_role_menu;
DROP TABLE sys_menu;
DROP TABLE sys_role;



/* Drop Sequences */

DROP SEQUENCE hibernate_sequence;
DROP SEQUENCE seq_sys_area;
DROP SEQUENCE seq_sys_dict;
DROP SEQUENCE seq_sys_mdict;
DROP SEQUENCE seq_sys_menu;
DROP SEQUENCE seq_sys_office;
DROP SEQUENCE seq_sys_role;
DROP SEQUENCE seq_sys_user;




/* Create Sequences */

CREATE SEQUENCE hibernate_sequence INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_area INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_dict INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_mdict INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_menu INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_office INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_role INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_sys_user INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE sys_area
(
	id number(19,0) NOT NULL,
	parent_id number(19,0) NOT NULL,
	parent_ids varchar2(255) NOT NULL,
	code varchar2(100),
	name varchar2(100) NOT NULL,
	type char(1),
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_dict
(
	id number(19,0) NOT NULL,
	label varchar2(100) NOT NULL,
	value varchar2(100) NOT NULL,
	type varchar2(100) NOT NULL,
	description varchar2(100) NOT NULL,
	sort number(10,0) NOT NULL,
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_mdict
(
	id number(19,0) NOT NULL,
	parent_id number(19,0) NOT NULL,
	parent_ids varchar2(255) NOT NULL,
	name varchar2(100) NOT NULL,
	description varchar2(100),
	sort number(10,0),
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_menu
(
	id number(19,0) NOT NULL,
	parent_id number(19,0) NOT NULL,
	parent_ids varchar2(255) NOT NULL,
	name varchar2(100) NOT NULL,
	href varchar2(255),
	target varchar2(20),
	icon varchar2(100),
	sort number(10,0) NOT NULL,
	is_show char(1) NOT NULL,
	permission varchar2(200),
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_office
(
	id number(19,0) NOT NULL,
	parent_id number(19,0) NOT NULL,
	parent_ids varchar2(255) NOT NULL,
	area_id number(19,0) NOT NULL,
	code varchar2(100),
	name varchar2(100) NOT NULL,
	type char(1) NOT NULL,
	grade char(1) NOT NULL,
	address varchar2(255),
	zip_code varchar2(100),
	master varchar2(100),
	phone blob,
	fax varchar2(200),
	email varchar2(200),
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_role
(
	id number(19,0) NOT NULL,
	office_id number(19,0),
	name varchar2(100) NOT NULL,
	enname varchar2(255),
	role_type varchar2(255),
	data_scope char(1),
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_role_menu
(
	role_id number(19,0) NOT NULL,
	menu_id number(19,0) NOT NULL,
	PRIMARY KEY (role_id, menu_id)
);


CREATE TABLE sys_role_office
(
	role_id number(19,0) NOT NULL,
	office_id number(19,0) NOT NULL,
	PRIMARY KEY (role_id, office_id)
);


CREATE TABLE sys_user
(
	id number(19,0) NOT NULL,
	company_id number(19,0) NOT NULL,
	office_id number(19,0) NOT NULL,
	login_name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	no varchar2(100),
	name varchar2(100) NOT NULL,
	email varchar2(200),
	phone varchar2(200),
	mobile varchar2(200),
	user_type char(1),
	login_ip varchar2(100),
	login_date timestamp,
	create_by number(19,0),
	create_date timestamp,
	update_by number(19,0),
	update_date timestamp,
	remarks varchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_user_role
(
	user_id number(19,0) NOT NULL,
	role_id number(19,0) NOT NULL,
	PRIMARY KEY (user_id, role_id)
);



/* Create Indexes */

CREATE INDEX sys_area_parent_id ON sys_area (parent_id);
CREATE INDEX sys_area_parent_ids ON sys_area (parent_ids);
CREATE INDEX sys_area_del_flag ON sys_area (del_flag);
CREATE INDEX sys_dict_value ON sys_dict (value);
CREATE INDEX sys_dict_label ON sys_dict (label);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id);
CREATE INDEX sys_mdict_parent_ids ON sys_mdict (parent_ids);
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id);
CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids);
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag);
CREATE INDEX sys_office_parent_id ON sys_office (parent_id);
CREATE INDEX sys_office_parent_ids ON sys_office (parent_ids);
CREATE INDEX sys_office_del_flag ON sys_office (del_flag);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag);
CREATE INDEX sys_user_office_id ON sys_user (office_id);
CREATE INDEX sys_user_login_name ON sys_user (login_name);
CREATE INDEX sys_user_company_id ON sys_user (company_id);
CREATE INDEX sys_user_update_date ON sys_user (update_date);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag);



/* Comments */

COMMENT ON TABLE sys_area IS '区域表';
COMMENT ON COLUMN sys_area.id IS '编号';
COMMENT ON COLUMN sys_area.parent_id IS '父级编号';
COMMENT ON COLUMN sys_area.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_area.code IS '区域编码';
COMMENT ON COLUMN sys_area.name IS '区域名称';
COMMENT ON COLUMN sys_area.type IS '区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）';
COMMENT ON COLUMN sys_area.create_by IS '创建者';
COMMENT ON COLUMN sys_area.create_date IS '创建时间';
COMMENT ON COLUMN sys_area.update_by IS '更新者';
COMMENT ON COLUMN sys_area.update_date IS '更新时间';
COMMENT ON COLUMN sys_area.remarks IS '备注信息';
COMMENT ON COLUMN sys_area.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_dict IS '字典表';
COMMENT ON COLUMN sys_dict.id IS '编号';
COMMENT ON COLUMN sys_dict.label IS '标签名';
COMMENT ON COLUMN sys_dict.value IS '数据值';
COMMENT ON COLUMN sys_dict.type IS '类型';
COMMENT ON COLUMN sys_dict.description IS '描述';
COMMENT ON COLUMN sys_dict.sort IS '排序（升序）';
COMMENT ON COLUMN sys_dict.create_by IS '创建者';
COMMENT ON COLUMN sys_dict.create_date IS '创建时间';
COMMENT ON COLUMN sys_dict.update_by IS '更新者';
COMMENT ON COLUMN sys_dict.update_date IS '更新时间';
COMMENT ON COLUMN sys_dict.remarks IS '备注信息';
COMMENT ON COLUMN sys_dict.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_mdict IS '区域表';
COMMENT ON COLUMN sys_mdict.id IS '编号';
COMMENT ON COLUMN sys_mdict.parent_id IS '父级编号';
COMMENT ON COLUMN sys_mdict.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_mdict.name IS '角色名称';
COMMENT ON COLUMN sys_mdict.description IS '描述';
COMMENT ON COLUMN sys_mdict.sort IS '排序（升序）';
COMMENT ON COLUMN sys_mdict.create_by IS '创建者';
COMMENT ON COLUMN sys_mdict.create_date IS '创建时间';
COMMENT ON COLUMN sys_mdict.update_by IS '更新者';
COMMENT ON COLUMN sys_mdict.update_date IS '更新时间';
COMMENT ON COLUMN sys_mdict.remarks IS '备注信息';
COMMENT ON COLUMN sys_mdict.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_menu IS '菜单表';
COMMENT ON COLUMN sys_menu.id IS '编号';
COMMENT ON COLUMN sys_menu.parent_id IS '父级编号';
COMMENT ON COLUMN sys_menu.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_menu.name IS '菜单名称';
COMMENT ON COLUMN sys_menu.href IS '链接';
COMMENT ON COLUMN sys_menu.target IS '目标（mainFrame、 _blank、_self、_parent、_top）';
COMMENT ON COLUMN sys_menu.icon IS '图标';
COMMENT ON COLUMN sys_menu.sort IS '排序（升序）';
COMMENT ON COLUMN sys_menu.is_show IS '是否在菜单中显示（1：显示；0：不显示）';
COMMENT ON COLUMN sys_menu.permission IS '权限标识';
COMMENT ON COLUMN sys_menu.create_by IS '创建者';
COMMENT ON COLUMN sys_menu.create_date IS '创建时间';
COMMENT ON COLUMN sys_menu.update_by IS '更新者';
COMMENT ON COLUMN sys_menu.update_date IS '更新时间';
COMMENT ON COLUMN sys_menu.remarks IS '备注信息';
COMMENT ON COLUMN sys_menu.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_office IS '部门表';
COMMENT ON COLUMN sys_office.id IS '编号';
COMMENT ON COLUMN sys_office.parent_id IS '父级编号';
COMMENT ON COLUMN sys_office.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_office.area_id IS '归属区域';
COMMENT ON COLUMN sys_office.code IS '区域编码';
COMMENT ON COLUMN sys_office.name IS '机构名称';
COMMENT ON COLUMN sys_office.type IS '机构类型（1：公司；2：部门；3：小组）';
COMMENT ON COLUMN sys_office.grade IS '机构等级（1：一级；2：二级；3：三级；4：四级）';
COMMENT ON COLUMN sys_office.address IS '联系地址';
COMMENT ON COLUMN sys_office.zip_code IS '邮政编码';
COMMENT ON COLUMN sys_office.master IS '负责人';
COMMENT ON COLUMN sys_office.phone IS '电话';
COMMENT ON COLUMN sys_office.fax IS '传真';
COMMENT ON COLUMN sys_office.email IS '邮箱';
COMMENT ON COLUMN sys_office.create_by IS '创建者';
COMMENT ON COLUMN sys_office.create_date IS '创建时间';
COMMENT ON COLUMN sys_office.update_by IS '更新者';
COMMENT ON COLUMN sys_office.update_date IS '更新时间';
COMMENT ON COLUMN sys_office.remarks IS '备注信息';
COMMENT ON COLUMN sys_office.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_role IS '角色表';
COMMENT ON COLUMN sys_role.id IS '编号';
COMMENT ON COLUMN sys_role.office_id IS '归属机构';
COMMENT ON COLUMN sys_role.name IS '角色名称';
COMMENT ON COLUMN sys_role.enname IS '英文名称';
COMMENT ON COLUMN sys_role.role_type IS '角色类型';
COMMENT ON COLUMN sys_role.data_scope IS '数据范围（0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置）';
COMMENT ON COLUMN sys_role.create_by IS '创建者';
COMMENT ON COLUMN sys_role.create_date IS '创建时间';
COMMENT ON COLUMN sys_role.update_by IS '更新者';
COMMENT ON COLUMN sys_role.update_date IS '更新时间';
COMMENT ON COLUMN sys_role.remarks IS '备注信息';
COMMENT ON COLUMN sys_role.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_role_menu IS '角色-菜单';
COMMENT ON COLUMN sys_role_menu.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_menu.menu_id IS '菜单编号';
COMMENT ON TABLE sys_role_office IS '角色-机构';
COMMENT ON COLUMN sys_role_office.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_office.office_id IS '机构编号';
COMMENT ON TABLE sys_user IS '用户表';
COMMENT ON COLUMN sys_user.id IS '编号';
COMMENT ON COLUMN sys_user.company_id IS '归属公司';
COMMENT ON COLUMN sys_user.office_id IS '归属部门';
COMMENT ON COLUMN sys_user.login_name IS '登录名';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.no IS '工号';
COMMENT ON COLUMN sys_user.name IS '姓名';
COMMENT ON COLUMN sys_user.email IS '邮箱';
COMMENT ON COLUMN sys_user.phone IS '电话';
COMMENT ON COLUMN sys_user.mobile IS '手机';
COMMENT ON COLUMN sys_user.user_type IS '用户类型';
COMMENT ON COLUMN sys_user.login_ip IS '最后登陆IP';
COMMENT ON COLUMN sys_user.login_date IS '最后登陆时间';
COMMENT ON COLUMN sys_user.create_by IS '创建者';
COMMENT ON COLUMN sys_user.create_date IS '创建时间';
COMMENT ON COLUMN sys_user.update_by IS '更新者';
COMMENT ON COLUMN sys_user.update_date IS '更新时间';
COMMENT ON COLUMN sys_user.remarks IS '备注信息';
COMMENT ON COLUMN sys_user.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON TABLE sys_user_role IS '用户-角色';
COMMENT ON COLUMN sys_user_role.user_id IS '用户编号';
COMMENT ON COLUMN sys_user_role.role_id IS '角色编号';



