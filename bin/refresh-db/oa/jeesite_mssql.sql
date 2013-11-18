
/* Drop Indexes */

DROP INDEX oa_leave_create_by;
DROP INDEX oa_leave_process_instance_id;
DROP INDEX oa_leave_del_flag;



/* Drop Tables */

DROP TABLE oa_leave;




/* Create Tables */

CREATE TABLE oa_leave
(
	id bigint NOT NULL IDENTITY ,
	process_instance_id varchar(64),
	start_time datetime,
	end_time datetime,
	leave_type varchar(20),
	reason varchar(255),
	apply_time datetime,
	reality_start_time datetime,
	reality_end_time datetime,
	create_by bigint,
	create_date datetime,
	update_by bigint,
	update_date datetime,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Create Indexes */

CREATE INDEX oa_leave_create_by ON oa_leave (create_by);
CREATE INDEX oa_leave_process_instance_id ON oa_leave (process_instance_id);
CREATE INDEX oa_leave_del_flag ON oa_leave (del_flag);



