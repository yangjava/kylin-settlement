<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改账户交易信息</title>
<jsp:include page="../../../base/base_page.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/settlement/trans/dsfDetailEdit.js"></script>
</head>
<body onclick="closeSelect()">
	<div class="area">
		<form name="dataForm" id="dataForm" method="post" action="${pageContext.request.contextPath}/transdetail/edit_ajax">
			<div class="main">
				<div class="blank15"></div>
				<div class="wrap">	
					<div class="con">
						<div class="con_title">
							<h3 class="left fs14 marglr3020">修改账户交易信息</h3>
							<div class="attr_con">
								<a href="javascript:void(0);" class="chan_btn right wid93 foc_cur margr40 margt10" id="btnSubmit">保存</a> 
								<a href="javascript:gotoUrl(document.referrer);" class="chan_btn right wid93 margr40 margt10">返回</a> 
							</div>
						</div>
						
						<div class="main_con">
							<div class="con_article_title02 paddtb20">
								<!-- 交易ID、交易请求号 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">交易ID：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.transDetailId}
									<input type="hidden" value="${settleTransDetail.transDetailId}" name="transDetailId" />
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">交易请求号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.requestNo}
								</label>
							</div>
							<!-- // 交易ID、交易请求号 -->
							<!-- 交易请求时间、统一交易流水号 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">交易请求时间：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<fmt:formatDate value="${settleTransDetail.requestTime}" pattern="yyyy-MM-hh HH:mm:ss"/>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">统一交易流水号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.transFlowNo}
								</label>
							</div>
							<!-- // 交易请求时间、统一交易流水号 -->
							<!-- 订单号、订单包号 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.orderNo}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单包号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.orderPackageNo}
								</label>
							</div>
							<!-- // 订单号、订单包号 -->
							<!-- 订单日期、订单金额 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单日期：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<fmt:formatDate value="${settleTransDetail.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单金额：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.orderAmount}
								</label>
							</div>
							<!-- // 订单日期、订单金额 -->
							<!-- 订单数量、订单类型 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单数量：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.orderCount}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">订单类型：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<c:choose>
										<c:when test="${settleTransDetail.orderType==0}">交易</c:when>
										<c:when test="${settleTransDetail.orderType==1}">结算单</c:when>
										<c:otherwise>${settleTransDetail.orderType}</c:otherwise>
									</c:choose>
								</label>
							</div>
							<!-- // 订单数量、订单类型 -->
							<!-- 功能编码、用户ID -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">功能编码：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.funcCode}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">用户ID：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.userId}
								</label>
							</div>
							<!-- // 功能编码、用户ID -->
							<!-- 中间商户编码、商户编码 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">中间商户编码：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.interMerchantCode}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">商户编码：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.merchantCode}
								</label>
							</div>
							<!-- // 中间商户编码、商户编码 -->
							<!-- 入账金额、手续费金额 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">入账金额：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.amount}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">手续费金额：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.feeAmount}
								</label>
							</div>
							<!-- // 入账金额、手续费金额 -->
							<!-- 用户手续费、业务类型 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">用户手续费：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.userFee}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">业务类型：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.businessType}
								</label>
							</div>
							<!-- // 用户手续费、业务类型 -->
							<!-- 支付渠道ID、银行联行编码 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">支付渠道：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<c:choose>
										<c:when test="${settleTransDetail.payChannelId=='01'}">通联</c:when>
										<c:when test="${settleTransDetail.payChannelId=='04'}">连连</c:when>
										<c:when test="${settleTransDetail.payChannelId=='05'}">联动优势</c:when>
										<c:when test="${settleTransDetail.payChannelId=='S01'}">畅捷</c:when>
										<c:otherwise>${settleTransDetail.payChannelId}</c:otherwise>
									</c:choose>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">银行联行编码：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.bankCode}
								</label>
							</div>
							<!-- // 支付渠道ID、银行联行编码 -->
							<!-- 消费者IP地址、产品号 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">消费者IP地址：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.userIpAddress}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">产品号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.productId}
								</label>
							</div>
							<!-- // 消费者IP地址、产品号 -->
							<!-- 错误编码、错误信息 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">错误编码：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.errorCode}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">错误信息：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.errorMsg}
								</label>
							</div>
							<!-- // 错误编码、错误信息 -->
							<!-- 被付方产品号、冲正/撤销标记 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">被付方产品号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.productWid}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">冲正/撤销标记：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<c:choose>
										<c:when test="${settleTransDetail.cancelInd==0}">正常</c:when>
										<c:when test="${settleTransDetail.cancelInd==1}">冲正</c:when>
										<c:when test="${settleTransDetail.cancelInd==2}">撤销</c:when>
										<c:otherwise>${settleTransDetail.cancelInd}</c:otherwise>
									</c:choose>
								</label>
							</div>
							<!-- // 被付方产品号、冲正/撤销标记 -->
							<!-- 数据来源、发送状态 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">数据来源：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<c:choose>
										<c:when test="${settleTransDetail.dataFrom==0}">账户</c:when>
										<c:when test="${settleTransDetail.dataFrom==1}">收银台</c:when>
										<c:when test="${settleTransDetail.dataFrom==2}">代收付</c:when>
										<c:otherwise>${settleTransDetail.dataFrom}</c:otherwise>
									</c:choose>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">发送状态：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.deliverStatusId}
								</label>
							</div>
							<!-- // 数据来源、发送状态 -->
							<!--结算订单号、状态 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">结算订单号：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.invoiceNo}
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">状态：</span>
								</label>
								<label class="label_txt wid190 margt11">
									${settleTransDetail.statusId}
								</label>
							</div>
							
							<!--结算订单号、代收付状态-->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">代收付状态：</span>
								</label>
								<div class="input_con_type_top wid190 margt4">
									<select style="width:189px;height:28px;" name="dflag">
										<option style="height:25px" value="0" ${(settleTransDetail.dflag==0)?'selected':''}>未处理</option>
										<option style="height:25px" value="1" ${(settleTransDetail.dflag==1)?'selected':''}>处理中</option>
										<option style="height:25px" value="4" ${(settleTransDetail.dflag==4)?'selected':''}>代收付失败</option>
										<option style="height:25px" value="40" ${(settleTransDetail.dflag==40)?'selected':''}>代收付失败，结果推送订单失败</option>
										<option style="height:25px" value="41" ${(settleTransDetail.dflag==41)?'selected':''}>代收付失败，结果推送订单成功</option>
										<option style="height:25px" value="6" ${(settleTransDetail.dflag==6)?'selected':''}>代收付成功</option>
										<option style="height:25px" value="60" ${(settleTransDetail.dflag==60)?'selected':''}>代收付成功，结果推送订单失败</option>
										<option style="height:25px" value="61" ${(settleTransDetail.dflag==61)?'selected':''}>代收付成功，结果推送订单成功</option>
										<option style="height:25px" value="99" ${(settleTransDetail.dflag==99)?'selected':''}>异常</option>
									</select>
								</div>
							</div>
							
							<!-- // 结算订单号、状态 -->
							<!--记账日期 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">读入交易状态：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<c:choose>
										<c:when test="${settleTransDetail.readStatusId==0}">失效</c:when>
										<c:when test="${settleTransDetail.readStatusId==1}">正常</c:when>
										<c:when test="${settleTransDetail.readStatusId==2}">对账成功</c:when>
										<c:when test="${settleTransDetail.readStatusId==3}">对账失败</c:when>
										<c:when test="${settleTransDetail.readStatusId==4}">付款成功</c:when>
										<c:when test="${settleTransDetail.readStatusId==5}">付款失败</c:when>
										<c:when test="${settleTransDetail.readStatusId==6}">冲正</c:when>
										<c:when test="${settleTransDetail.readStatusId==7}">已汇总</c:when>
										<c:when test="${settleTransDetail.readStatusId==8}">已分润</c:when>
										<c:when test="${settleTransDetail.readStatusId==9}">退票</c:when>
										<c:when test="${settleTransDetail.readStatusId==10}">受理</c:when>
										<c:when test="${settleTransDetail.readStatusId==11}">发送异常</c:when>
										<c:when test="${settleTransDetail.readStatusId==12}">银行已受理</c:when>
										<c:when test="${settleTransDetail.readStatusId==13}">银行未受理</c:when>
										<c:when test="${settleTransDetail.readStatusId==14}">处理失败</c:when>
										<c:when test="${settleTransDetail.readStatusId==15}">部分成功</c:when>
										<c:when test="${settleTransDetail.readStatusId==16}">成功</c:when>
										<c:when test="${settleTransDetail.readStatusId==17}">退票</c:when>
										<c:otherwise>${settleTransDetail.readStatusId}</c:otherwise>
									</c:choose>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">记账日期：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<fmt:formatDate value="${settleTransDetail.accountDate}" pattern="yyyy-MM-dd"/>
								</label>
							</div>
							<!-- // 记账日期 -->
							<!--记录创建时间、记录更新时间 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">记录创建时间：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<fmt:formatDate value="${settleTransDetail.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</label>
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">记录更新时间：</span>
								</label>
								<label class="label_txt wid190 margt11">
									<fmt:formatDate value="${settleTransDetail.updatedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</label>
							</div>
							<!-- // 记录创建时间、记录更新时间-->
							
							<!-- 备注 -->
							<div class="blank10"></div>
							<div class="con_core_info_div05">
								<label class="label_txt wid130 txtright margt10 margr8">
									<span class="right">备注：</span>
								</label>
								<div >
									<textarea style="width:343px; height:111px" name="remark">${settleTransDetail.remark}</textarea>
								</div>
							</div>
							<!-- // 备注 -->
							<div class="blank20"></div>
								
							</div>		
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>