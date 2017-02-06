
<%@ page import="com.infiniteintelligence.wts.threat.Threat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'threat.label', default: 'Threat')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-threat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-threat" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list threat">
			
				<g:if test="${threatInstance?.dateBegin}">
				<li class="fieldcontain">
					<span id="dateBegin-label" class="property-label"><g:message code="threat.dateBegin.label" default="Date Begin" /></span>
					
						<span class="property-value" aria-labelledby="dateBegin-label"><g:formatDate date="${threatInstance?.dateBegin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${threatInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="threat.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${threatInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${threatInstance?.dateEnd}">
				<li class="fieldcontain">
					<span id="dateEnd-label" class="property-label"><g:message code="threat.dateEnd.label" default="Date End" /></span>
					
						<span class="property-value" aria-labelledby="dateEnd-label"><g:formatDate date="${threatInstance?.dateEnd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${threatInstance?.threatSeverityCode}">
				<li class="fieldcontain">
					<span id="threatSeverityCode-label" class="property-label"><g:message code="threat.threatSeverityCode.label" default="Threat Severity Code" /></span>
					
						<span class="property-value" aria-labelledby="threatSeverityCode-label"><g:link controller="threatSeverityCode" action="show" id="${threatInstance?.threatSeverityCode?.id}">${threatInstance?.threatSeverityCode?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${threatInstance?.threatTypeCode}">
				<li class="fieldcontain">
					<span id="threatTypeCode-label" class="property-label"><g:message code="threat.threatTypeCode.label" default="Threat Type Code" /></span>
					
						<span class="property-value" aria-labelledby="threatTypeCode-label"><g:link controller="threatTypeCode" action="show" id="${threatInstance?.threatTypeCode?.id}">${threatInstance?.threatTypeCode?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:threatInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${threatInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
