<%@ page import='java.util.*,com.doublechaintech.retailscm.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sky" tagdir="/tags"%>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${ empty originalVoucherConfirmationList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['original_voucher_confirmation']}! 
		 <a href="./${ownerBeanName}Manager/addOriginalVoucherConfirmation/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty originalVoucherConfirmationList}" >
    
    
<%

 	SmartList list=(SmartList)request.getAttribute("originalVoucherConfirmationList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("rowsPerPage",list.getRowsPerPage()); 
 	
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//pageContext.setAttribute("accessible",list.isAccessible()); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['original_voucher_confirmation']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addOriginalVoucherConfirmation/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'originalVoucherConfirmationList' eq action.actionGroup}">
		<a class="btn btn-${action.actionLevel} btn-sm" href="${action.managerBeanName}/${action.actionPath}">${userContext.localeMap[action.localeKey]}</a>
		</c:if>
	</c:forEach>
	</div><!--end of div class="btn-group" -->
	
		 
		 
		 
		 </div>
 </div>
    
    
<div class="table-responsive">


<c:set var="currentPageNumber" value="1"/>	



<nav aria-label="Page navigation example">
  <ul class="pagination">
<c:forEach var="page" items="${pages}"> 
<c:set var="classType" value=""/>
<c:if test='${page.selected}' >
<c:set var="classType" value="active"/>
<c:set var="currentPageNumber" value="${page.pageNumber}"/>
</c:if>


	<li class="page-item ${classType}">
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/${originalVoucherConfirmationListName};${originalVoucherConfirmationListName}CurrentPage=${page.pageNumber};${originalVoucherConfirmationListName}RowsPerPage=${rowsPerPage}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='originalVoucherConfirmationListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['original_voucher_confirmation.id']}</th>
</c:if>
<c:if test="${param.referName ne 'who'}">
	<th>${userContext.localeMap['original_voucher_confirmation.who']}</th>
</c:if>
<c:if test="${param.referName ne 'comments'}">
	<th>${userContext.localeMap['original_voucher_confirmation.comments']}</th>
</c:if>
<c:if test="${param.referName ne 'makeDate'}">
	<th>${userContext.localeMap['original_voucher_confirmation.make_date']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${originalVoucherConfirmationList}">
				<tr currentVersion='${item.version}' id="originalVoucherConfirmation-${item.id}" ><td><a class="link-action-removed" href="./originalVoucherConfirmationManager/view/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'who'}">	<td contenteditable='true' class='edit-value'  propertyToChange='who' storedCellValue='${item.who}' prefix='${ownerBeanName}Manager/updateOriginalVoucherConfirmation/${result.id}/${item.id}/'>${item.who}</td>
</c:if><c:if test="${param.referName ne 'comments'}">	<td contenteditable='true' class='edit-value'  propertyToChange='comments' storedCellValue='${item.comments}' prefix='${ownerBeanName}Manager/updateOriginalVoucherConfirmation/${result.id}/${item.id}/'>${item.comments}</td>
</c:if><c:if test="${param.referName ne 'makeDate'}">	<td contenteditable='true' class='edit-value'  propertyToChange='makeDate' storedCellValue='${item.makeDate}' prefix='${ownerBeanName}Manager/updateOriginalVoucherConfirmation/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.makeDate}" /></td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeOriginalVoucherConfirmation/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyOriginalVoucherConfirmationFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


