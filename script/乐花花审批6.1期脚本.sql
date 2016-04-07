-- 陈凯特脚本

SELECT @MENU_ID:=ID ,@MENU_CODE:=`CODE` FROM tb_sys_menu WHERE `NAME` = '黑名单';

INSERT INTO `tb_sys_resource` (`MENU_ID`, `MENU_CODE`, `CODE`, `NAME`, `URL`, `STATUS`, `DESCRIPTION`)
VALUES(@MENU_ID, @MENU_CODE, '451', '导入黑名单数据', '/cus/blackLeadIn','1',NULL);

/*修改为常用英文命名*/
UPDATE tb_sys_resource SET URL = '/cus/blackInput' WHERE `NAME` = '导入黑名单数据';

-- 易梦缘脚本

UPDATE `tb_sys_menu` SET NAME='销售业务学校排名表',SEQ='3' WHERE URL='report/rpt_captial.jsp';
UPDATE `tb_sys_menu` SET NAME='销售业务城市排名表',SEQ='2' WHERE URL='report/rpt_captial_city.jsp';
UPDATE `tb_sys_menu` SET NAME='销售业务省份排名表',SEQ='1' WHERE URL='report/rpt_captial_province.jsp';
UPDATE `tb_sys_menu` SET NAME='销售业务明细表',SEQ='4' WHERE URL='report/rpt_captial_detail.jsp';
UPDATE `tb_sys_menu` SET NAME='审批工作员工排名表',SEQ='6' WHERE URL='report/rpt_aduit_emp_rank.jsp';
UPDATE `tb_sys_menu` SET NAME='审批工作报表',SEQ='5' WHERE URL='report/rpt_aduit_rank.jsp';
UPDATE `tb_sys_menu` SET NAME='审批工作个人明细表',SEQ='7' WHERE URL='report/rpt_aduit_detail.jsp';


-- 邱志伟脚本

#特批业务申请表冗余期数字段
ALTER TABLE tb_spl_applyspecial ADD COLUMN `PAY_PHASES` INT(22) DEFAULT NULL COMMENT '还款期数';

#将详情表的期数字段刷到特批业务申请表
UPDATE tb_spl_applyspecial special,tb_spl_applyspecialdetail detail SET special.PAY_PHASES=detail.PAY_PHASES WHERE special.SPLAPPLY_CODE=detail.SPLAPPLY_CODE;

-- 陆求来脚本

SELECT @parentcode:=CODE FROM tb_sys_menu WHERE NAME='财务';

INSERT INTO `tb_sys_menu`(CODE,NAME,URL,PARENT_CODE,LEVEL,SEQ,STATUS)  VALUES('0809','应还款查询','repayment/shouldReimbursementList',@parentcode,2,4,'1');

SELECT @menu_id:=id,@menu_code:=CODE FROM tb_sys_menu WHERE NAME='应还款查询';

INSERT INTO tb_sys_resource(MENU_ID,MENU_CODE,CODE,NAME,URL,STATUS) VALUES(@menu_id,@menu_code,'452',"应还款查询","/repayment/shouldReimbursementList",1);


-- 刘小东脚本

#把数据字典中的‘代金卷支付’改成‘免还卷’
update tb_sys_dict set DATA_VALUE ='免还券' where DATA_TYPE = 'TransactionType' AND DATA_CODE = 'volumePay';
