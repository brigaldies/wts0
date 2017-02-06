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

<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'threatSeverityCode', 'error')} required">
	<label for="threatSeverityCode">
		<g:message code="threat.threatSeverityCode.label" default="Threat Severity Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="threatSeverityCode" name="threatSeverityCode.id" from="${com.infiniteintelligence.wts.threat.ThreatSeverityCode.list()}" optionKey="id" required="" value="${threatInstance?.threatSeverityCode?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: threatInstance, field: 'threatTypeCode', 'error')} required">
	<label for="threatTypeCode">
		<g:message code="threat.threatTypeCode.label" default="Threat Type Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="threatTypeCode" name="threatTypeCode.id" from="${com.infiniteintelligence.wts.threat.ThreatTypeCode.list()}" optionKey="id" required="" value="${threatInstance?.threatTypeCode?.id}" class="many-to-one"/>

</div>

