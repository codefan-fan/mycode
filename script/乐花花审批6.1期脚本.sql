-- �¿��ؽű�

SELECT @MENU_ID:=ID ,@MENU_CODE:=`CODE` FROM tb_sys_menu WHERE `NAME` = '������';

INSERT INTO `tb_sys_resource` (`MENU_ID`, `MENU_CODE`, `CODE`, `NAME`, `URL`, `STATUS`, `DESCRIPTION`)
VALUES(@MENU_ID, @MENU_CODE, '451', '�������������', '/cus/blackLeadIn','1',NULL);

/*�޸�Ϊ����Ӣ������*/
UPDATE tb_sys_resource SET URL = '/cus/blackInput' WHERE `NAME` = '�������������';

-- ����Ե�ű�

UPDATE `tb_sys_menu` SET NAME='����ҵ��ѧУ������',SEQ='3' WHERE URL='report/rpt_captial.jsp';
UPDATE `tb_sys_menu` SET NAME='����ҵ�����������',SEQ='2' WHERE URL='report/rpt_captial_city.jsp';
UPDATE `tb_sys_menu` SET NAME='����ҵ��ʡ��������',SEQ='1' WHERE URL='report/rpt_captial_province.jsp';
UPDATE `tb_sys_menu` SET NAME='����ҵ����ϸ��',SEQ='4' WHERE URL='report/rpt_captial_detail.jsp';
UPDATE `tb_sys_menu` SET NAME='��������Ա��������',SEQ='6' WHERE URL='report/rpt_aduit_emp_rank.jsp';
UPDATE `tb_sys_menu` SET NAME='������������',SEQ='5' WHERE URL='report/rpt_aduit_rank.jsp';
UPDATE `tb_sys_menu` SET NAME='��������������ϸ��',SEQ='7' WHERE URL='report/rpt_aduit_detail.jsp';


-- ��־ΰ�ű�

#����ҵ����������������ֶ�
ALTER TABLE tb_spl_applyspecial ADD COLUMN `PAY_PHASES` INT(22) DEFAULT NULL COMMENT '��������';

#�������������ֶ�ˢ������ҵ�������
UPDATE tb_spl_applyspecial special,tb_spl_applyspecialdetail detail SET special.PAY_PHASES=detail.PAY_PHASES WHERE special.SPLAPPLY_CODE=detail.SPLAPPLY_CODE;

-- ½�����ű�

SELECT @parentcode:=CODE FROM tb_sys_menu WHERE NAME='����';

INSERT INTO `tb_sys_menu`(CODE,NAME,URL,PARENT_CODE,LEVEL,SEQ,STATUS)  VALUES('0809','Ӧ�����ѯ','repayment/shouldReimbursementList',@parentcode,2,4,'1');

SELECT @menu_id:=id,@menu_code:=CODE FROM tb_sys_menu WHERE NAME='Ӧ�����ѯ';

INSERT INTO tb_sys_resource(MENU_ID,MENU_CODE,CODE,NAME,URL,STATUS) VALUES(@menu_id,@menu_code,'452',"Ӧ�����ѯ","/repayment/shouldReimbursementList",1);


-- ��С���ű�

#�������ֵ��еġ������֧�����ĳɡ��⻹��
update tb_sys_dict set DATA_VALUE ='�⻹ȯ' where DATA_TYPE = 'TransactionType' AND DATA_CODE = 'volumePay';
