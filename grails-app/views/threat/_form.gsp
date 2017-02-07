<%@ page import="com.infiniteintelligence.wts.threat.Threat" %>



<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'dateBegin', 'error')} required">
	<label for="dateBegin">
		<g:message code="threat.dateBegin.label" default="Date Begin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateBegin" precision="day"  value="${threatInstance?.dateBegin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'dateEnd', 'error')} required">
	<label for="dateEnd">
		<g:message code="threat.dateEnd.label" default="Date End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateEnd" precision="day"  value="${threatInstance?.dateEnd}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'threatSeverity', 'error')} required">
	<label for="threatSeverity">
		<g:message code="threat.threatSeverity.label" default="Threat Severity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="threatSeverity" name="threatSeverity.id" from="${com.infiniteintelligence.wts.threat.ThreatSeverityCode.list()}" optionKey="code" required="" value="${threatInstance?.threatSeverity?.code}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'threatType', 'error')} required">
	<label for="threatType">
		<g:message code="threat.threatType.label" default="Threat Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="threatType" name="threatType.id" from="${com.infiniteintelligence.wts.threat.ThreatTypeCode.list()}" optionKey="code" required="" value="${threatInstance?.threatType?.code}" class="many-to-one"/>

</div>

