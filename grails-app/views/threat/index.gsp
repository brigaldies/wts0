
<%@ page import="com.infiniteintelligence.wts.threat.Threat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'threat.label', default: 'Threat')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-threat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-threat" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateBegin" title="${message(code: 'threat.dateBegin.label', default: 'Date Begin')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'threat.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateEnd" title="${message(code: 'threat.dateEnd.label', default: 'Date End')}" />
					
						<th><g:message code="threat.threatSeverityCode.label" default="Threat Severity Code" /></th>
					
						<th><g:message code="threat.threatTypeCode.label" default="Threat Type Code" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${threatInstanceList}" status="i" var="threatInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${threatInstance.id}">${fieldValue(bean: threatInstance, field: "dateBegin")}</g:link></td>
					
						<td><g:formatDate date="${threatInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${threatInstance.dateEnd}" /></td>
					
						<td>${fieldValue(bean: threatInstance, field: "threatSeverityCode")}</td>
					
						<td>${fieldValue(bean: threatInstance, field: "threatTypeCode")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${threatInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
