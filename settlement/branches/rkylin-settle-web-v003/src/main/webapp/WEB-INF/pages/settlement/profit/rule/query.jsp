<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清分规则明细信息</title>

<jsp:include page="../../../base/base_page.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/settlement/profit/ruleQuery.js"></script>
</head>
<div class="area">
	<form name="dataForm" id="dataForm" method="post" action="${pageContext.request.contextPath}/profitrule/query_ajax">
		<div class="main">
			<div class="blank15"></div>
			<div class="wrap">
				<div class="con">
					<div class="con_title">
						<h3 class="left fs14 marglr3020">清分规则明细信息</h3>
						<span class="grey"></span>
					</div>
					<div class="main_con" style="display: ">
						<div class="con_article_title tit_zindex3 linehei30">
							<b class="left paddl67 paddr10">内容筛选</b> <a href="javascript:;"
								class="margt10 btn_arrow_up" id="reg2_arrow"></a>
						</div>
						<div class="con_article_title02 tit_zindex6" id="reg2_arrow_con">
							<div class="con_article_title02 margt10 tit_zindex5 paddl52" style="width:90%">
								<label class="label_txt wid135 txtright margr8 margt11">明细ID： </label>
								<div class="input_con_type_top wid190 margt4">
									<input type="text" class="wid190" name="profitDetailId" id="profitDetailId" />
								</div>
								<label class="label_txt wid135 txtright margr8 margt11">子ID： </label>
								<div class="input_con_type_top wid190 margt4">
									<input type="text" class="wid190" name="subId" id="subId" />
								</div>
								<label class="label_txt wid135 txtright margr8 margt11 margl16">管理机构代码： </label>
								<div class="input_con_type_top wid190 margt4">
									<input type="text" class="wid190" name="rootInstCd" id="rootInstCd" />
								</div>
							</div>
							<div class="con_article_title02 margt10 tit_zindex5 paddl52" style="width:90%">
								<label class="label_txt wid135 txtright margr8 margt11">产品号： </label>
								<div class="input_con_type_top wid190 margt4">
									<input type="text" class="wid190" name="productId" id="productId" />
								</div>
								<label class="label_txt wid135 txtright margr8 margt11">分润对象： </label>
								<div class="input_con_type_top wid190 margt4">
									<input type="text" class="wid190" name="userId" id="userId" />
								</div>
								<label class="label_txt wid135 txtright margr8 margt11 margl16">分润对象形态： </label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="profitObject">
										<option style="height:25px" value="-1">所有</option>
										<option style="height:25px" value="1">固定</option>
										<option style="height:25px" value="2">可变</option>
									</select>
								</div>
							</div>
							<div class="con_article_title02 margt10 tit_zindex5 paddl52" style="width:90%">
								<label class="label_txt wid135 txtright margr8 margt11">清分类型： </label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="profitType">
										<option style="height:25px" value="-1">所有</option>
										<option style="height:25px" value="0">分润</option>
										<option style="height:25px" value="1">代收</option>
										<option style="height:25px" value="2">代付</option>
									</select>
								</div>
								<label class="label_txt wid135 txtright margr8 margt11">必须： </label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="isMust">
										<option style="height:25px" value="-1">全部</option>
										<option style="height:25px" value="0">否</option>
										<option style="height:25px" value="1">是</option>
									</select>
								</div>
								<label class="label_txt wid135 txtright margr8 margt11 margl16">分润模式： </label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="profitMd">
										<option style="height:25px" value="-1">全部</option>
										<option style="height:25px" value="0">不启用</option>
										<option style="height:25px" value="1">比例</option>
										<option style="height:25px" value="2">固定</option>
									</select>
								</div>
							</div>
							<div class="con_article_title02 margt10 tit_zindex5 paddl52" style="z-index:10;width:90%">
								<label class="label_txt wid135 txtright margr8 margt11">状态</label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="statusId">
										<option style="height:25px" value="-1">全部</option>
										<option style="height:25px" value="0">无效</option>
										<option style="height:25px" value="1">有效</option>
									</select>
								</div>
								<label class="label_txt wid135 txtright margr8 margt11">有效时间： </label>
								<div class="input_time_type wid190 margt4">
									<input id="checkStartTime" type="text" readonly="readonly"
										name="startTimeStr"
										class="wid140 hasDatepicker" value=""> 
										<a href="javascript:;"
										onclick="WdatePicker({el:'checkStartTime',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'checkEndTime\')}'})"
										class="right icon_timer timer_calender margtr36"></a>
								</div>
								<div class="left wid10 paddtrl184">
									<span class="left wid10 bord19"></span>
								</div>
								<div class="input_time_type wid190 margt4">
									<input id="checkEndTime" type="text" readonly="readonly"
										name="endTimeStr"
										class="wid140 hasDatepicker" value=""> 
										<a href="javascript:;"
										onclick="WdatePicker({el:'checkEndTime',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'checkStartTime\')}'})"
										class="right icon_timer timer_calender margtr36"></a>
								</div>
							</div>
							<div class="con_article_title02 margt10 tit_zindex3">
								<a href="javascript:void(0);" class="right chan_btn wid60 margr66 margt5" onclick="resetForm();">清除</a> 
								<a href="javascript:void(0);" class="right chan_btn wid60 margr30 margt5" onclick="funSearch(1);">查询</a>
							</div>
						</div>

						<div class="bord11 margt10"></div>
						<div class="con_core_info_main wid1125 paddl10 margt10" style="width:1225px;">
							<ul class="table_menu">
								<li>
									<a class="left chan_btn wid160 margl10 margt5" id="addBtn" href="profitrule/rule_open_add">新增清分规则明细信息</a>
								</li>
							</ul>
							<table class="chan_table tb_bord01" id="user_table1">
							</table>
						</div>
						<div class="left wid500 paddl60 margt10 rel_pos"
							style="height:42px;">
							<label class="label_txt wid60 txtright margr8 margt11">
								每页显示 </label>
							<div class="input_con_type_top wid95 margt4">
								<select style="width:94px;height:27px" name="pageSize" id="pageSize">
									<option style="height:25px" value="10">10</option>
									<option style="height:25px" value="50">50</option>
									<option style="height:25px" value="100">100</option>
								</select>
							</div>
							<label class="label_txt wid60 txtleft margl6 margt11">
								条记录 </label> 
								<input id="saveSelectData" type="hidden"
								value='${sessionDetail }' name="saveSelectData"/>
						</div>
						<div id="div_table_page" class="chan_table_page_wrap wid620 margt10 paddr36">
							<div class="chan_table_page"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 分页隐藏域 -->
		<input type="hidden" id="pageIndex" name="pageIndex" value="1" /> <input
			type="hidden" id="pageSize" name="pageSize" value="10" />
		<!-- // 分页隐藏域 -->
	</form>
</div>
</body>
</html>