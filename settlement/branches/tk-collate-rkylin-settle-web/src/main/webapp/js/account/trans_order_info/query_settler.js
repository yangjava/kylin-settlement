/***
 * 
 */
$(function() {
	funSearch(1);
	$("#btnSubmit").click(function() {
		valieQueryTime();	
	});
	fixedTableTitleForTop("user_table1");


});
/***
 * 
 */
function valieQueryTime() {
	var $checkStartTime = $("#checkStartTime");
	var $checkEndTime = $("#checkEndTime");
	if($checkStartTime && $checkEndTime && $checkStartTime.val() && $checkEndTime.val()) {
		getOrdInfoAndSearch(1);
	} else {
		var $div = $("#valiDiv");
		$div.css("font-style", "italic");
		$div.css("color", "#ff0000");
		$div.html("&nbsp;请输入交易时间再进行读入操作&nbsp;");
	}
}
/***
 * 
 */
function loadingFun() {
	var butt = document.getElementById("btnSubmit");
	butt.onclick = function() {};
	butt.style.width = "100px";
	butt.innerHTML = "正在读取... ...";
}
function loadedFun() {
	var butt = document.getElementById("btnSubmit");
	butt.onclick = function(){funSearch(1);};
	butt.style.width = "60px";
	butt.innerHTML = "读取交易";
}
/***
 * ajax获取分页信息和显示数据
 */
function getOrdInfoAndSearch(pageIndex, index) {
	loadingFun();
	var pageSize = $("#dataForm #pageSize option:selected").val();		//显示条数
	$('#dataForm #pageIndex').val(pageIndex);							//赋值当前页
	$('#dataForm #pageSize').val(pageSize);								//赋值显示条数
	$.post(
		$('#dataForm').attr("action"),									//发送请求 url
		$('#dataForm').serialize(),										//表单数据
		function(data) {
			showDataTr(data, pageSize, pageIndex, index);
			loadedFun();
		},
		'json'
	);
}
/***
 * 生成代收付文件
 */
function createGenPayFile(flg) {
	if (flg == 1) {
		if(valiCheckForm()) {
			$("#pay_trans_form #idsStr").val(getIds());
			$.ajax({
	            type: "POST",
	            url: $('#pay_trans_form').attr("action"),
	            data: $('#pay_trans_form').serialize(),
	            dataType: "text",
	            success: function(data){
					alert(data);
	            },
	            error:function(data){
	            	alert("生成支付交易异常！");
	            }
	         });
		} else {
			return;
		}
	} else if (flg == 2) {
		if(valiCheckForm()) {
			$("#pay_trans_form2 #idsStr").val(getIds());
			$.ajax({
	            type: "POST",
	            url: $('#pay_trans_form2').attr("action"),
	            data: $('#pay_trans_form2').serialize(),
	            dataType: "text",
	            success: function(data){
					alert(data);
	            },
	            error:function(data){
	            	alert("发送支付交易异常！");
	            }
	         });
		} else {
			return;
		}
	}
}
/***
 * 校验选择交易和验证内容
 * @returns {Boolean}
 */
function valiCheckForm() {
	var checkTransCount = document.getElementById("checkTransCount").value;
	var checkTransAmount = document.getElementById("checkTransAmount").value;
	var sumAmount = getSumAmount();
	var transCount = getTransCount();
	if(!transCount) {
		alert("请选择交易信息!");
		return false;
	} else if(!checkTransCount) {
		alert("请填写 验证内容:交易总条数!");
		return false;
	} else if(!checkTransAmount) {
		alert("请填写 验证内容:交易总金额!");
		return false;
	} else if(transCount != checkTransCount) {
		alert("交易总条数与验证内容不匹配!");
		return false;
	} else if(sumAmount != checkTransAmount) {
		alert("交易总金额与验证内容不匹配!");
		return false;
	}
	if (confirm("是否确认进行付款？")) {
		return true;
	}
}
/***
 * 获取所有选中交易ID
 */
function getIds() {
	var idArr = $(".ids_box:checked");
	var idsStr = "";
	
	for(var i = 0; i < idArr.length; i ++) {
		idsStr += ","+idArr[i].value;
	}
	idsStr = idsStr.substring(1);
	
	return idsStr;
}
/***
 * 获取所有交易金额并求和
 */
function getSumAmount() {
	//var amountsStr = document.getElementsByName("amounts");
	var amountsStr = $(".ids_box:checked ~ input[type=hidden]");
	var sumAmount = 0;
	for(var i = 0; i < amountsStr.length; i ++) {
		var amount = Number(amountsStr[i].value);
		sumAmount += amount;
	}
	return sumAmount;
}
/***
 * 获取所有选中交易总数
 */
function getTransCount() {
	return $(".ids_box:checked").length;
}
/***
 * ajax获取分页信息和显示数据
 */
function funSearch(pageIndex, index) {
	var pageSize = $("#dataForm #pageSize option:selected").val();		//显示条数
	$('#dataForm #pageIndex').val(pageIndex);							//赋值当前页
	$('#dataForm #pageSize').val(pageSize);								//赋值显示条数
	$.post(
		$('#dataForm').attr("action"),									//发送请求 url
		$('#dataForm').serialize(),										//表单数据
		function(data) {
			showDataTr(data, pageSize, pageIndex, index);
		},
		'json'
	);
}
function showDataTr(data ,pageSize, pageIndex, index) {
	//回调函数
	//jq在页面中生成展示数据
	var tableHead = 
	'<tr class="tb-head-no" id="head-no">' +
	'<th>ID</th>' +
	'<th >交易类型</th>' +
	'<th >管理机构代码</th>' +
	'<th >商户订单号</th>' +
	'<th >系统订单号</th>' +
	'<th >付款方ID</th>' +
	'<th >收款方ID</th>' +
	'<th >交易时间</th>' +
	'<th >交易金额</th>' +
	'<th >账期</th>' +
	'<th >交易状态</th>' +
	'<th>备注</th>' +
	'</tr>';
	var trdata = [tableHead];
	if (data.result == "ok") {
		var list = data.dataList;
		if (list == null || list.length == 0) {
			var nodata = "<tr><td colspan='14'>没有符合条件的数据</td></tr>";
			trdata.push(nodata);
			$("#user_table1").html(trdata.join(''));
			drawPage(1, 1, 9);
			return false;
		}
		for (var i = 0; i < list.length; i++) {
			var date = new Date();
			date.setTime(list[i].accountDate);
			var requestTime = new Date();
			requestTime.setTime(list[i].requestTime);
			list[i].accountDate = date.toLocaleDateString();
			list[i].requestTime = requestTime.toLocaleString();
			
			if (list[i].remark == null) {
				list[i].remark = "";
			}
			
			trdata.push('<tr onclick="selectCheck(this)">');
			trdata.push('<td>');
			trdata.push('<input type="checkbox" class="ids_box" value="'+list[i].requestId+'" name="ids" />');
			trdata.push('<input type="hidden" value="'+list[i].amount+'" name="amounts" />');
			trdata.push("<label title='"+list[i].requestId+"'>"+list[i].requestId+"</label>");
			trdata.push('</td><td>');
			trdata.push("<label title='"+list[i].funcCode+"'>"+list[i].funcCode+"</label>");
			trdata.push('</td><td>');
			trdata.push(list[i].merchantCode);
			trdata.push('</td><td>');
			trdata.push(list[i].requestNo);
			trdata.push('</td><td>');
			trdata.push(list[i].orderNo);
			trdata.push('</td><td>');
			trdata.push(list[i].userId);
			trdata.push('</td><td>');
			trdata.push(list[i].interMerchantCode);
			trdata.push('</td><td>');
			trdata.push("<label title='"+list[i].requestTime+"'>"+list[i].requestTime+"</label>");
			trdata.push('</td><td>');
			trdata.push(list[i].amount);
			trdata.push('</td><td>');
			trdata.push(list[i].accountDate);
			trdata.push('</td><td>');
			trdata.push(list[i].status);
			trdata.push('</td><td>');
			trdata.push("<label title='"+list[i].remark+"'>"+list[i].remark+"</label>");
			trdata.push('</td>');
			trdata.push('</tr>');
		}
		$("#user_table1").html(trdata.join(''));
		var totalNum = data.totalNum;
		//调用绘制分页的方法
		drawPageAgain(totalNum, pageIndex, pageSize, index);
		$('#div_table_page').show();
	}else{
		var nodata = "<tr><td colspan='14'>没有符合条件的数据</td></tr>";
		trdata.push(nodata);
		$("#user_table1").html(trdata.join(''));
		drawPage(1, 1, 9);
		return false;
	}


}
/***
 * 刷新页面
 */
function resetForm(){
	funSearch(1);
}

function selectCheck(obj){
	var checkbox = $(obj).find("td").eq(0).find("input");
	if(checkbox.is(':checked')){
		checkbox.prop("checked", false)
		$(obj).find("td").removeClass("tb_style");
	}else{
		checkbox.prop("checked",true);

		$(obj).find("td").addClass("tb_style");
	}

}

