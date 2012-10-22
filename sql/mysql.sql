drop database if exists webjoyce;
create database webjoyce;
use webjoyce;

-- �û���
create table user
(
	userid int(64) not null primary key, -- �û�ΨһID
	email varchar(128) not null, -- email��Ҳ���û���
	rescue_email varchar(128) not null, -- �һ������õ�email
	password varchar(32) not null, -- ���� 
	nickname varchar(32) not null -- �ǳ�
);

-- ��վ��
create table website
(
	siteid int(64) not null primary key, -- ��վΨһID
	url varchar(128) not null,
	desc varchar(128) not null, -- ����
	screen_shot blob null ,-- ��ͼ		
);

-- ���ࣨ���򣩱�
create table domain
(
	domainid int(64) not null primary key,
	name varchar(32) not null,
	desc varchar(128) not null,
);

-- ��վ�����
create table website_domain
(
	siteid int(64) not null,
	domainid int(64) not null
);

-- �û���ע����վ
create table user_follow_website
(
	userid int(64) not null,
	websiteid int(64) not null
);

-- �û���ע������
create table user_follow_domain
(
	userid int(64) not null,
	domainid int(64) not null
);

-- �û���ע����
create table user_folow_idol
(
	userid int(64) not null,
	idolid int(64) not null
);

-- �û��ղص���ַ
create table favorite_websites
(
	id int(64) not null auto_incremental primary key,
	websiteid int(64) not null,
	userid int(64) not null
);

-- ֪ͨ���� ,����XX�û���XX�������ϴ�����վXX
create table user_notification
(
	userid int(64) not null,
	operator int(64) not null,
	target int(64) not null,
	target_type int(8) not null,
	operation_type int(8) not null,
	state int(8) not null
);

-- �޸ļ�¼,���� XX�û� �� XX��վ ����˽�ͼ
create table modification
(
	modid int(64) not null, 
	operator int(64) not null,-- ������ID
	objectid int(64) not null,-- ��������ID
	object_type int(8) not null, -- ��������
	operation_type int(8) not null -- ����ʲô����
);

-- ��վ���۱�
create table website_comment
(
	commentid int(64) not null,
	websiteid int(64) not null,
	userid int(64) not null,
	comment varchar(1024) not null
);