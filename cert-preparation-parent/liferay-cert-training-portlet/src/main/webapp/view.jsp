<%@ include file="init.jsp" %>

<liferay-portlet:renderURL var="proceedToFirstForm">
    <liferay-portlet:param name="mvcPath" value="/v_first.jsp" />
    <liferay-portlet:param name="redirect" value="${currentURL}" />
</liferay-portlet:renderURL>

<liferay-ui:header
        title="welcome-header"
        backURL="siema" />

<p><liferay-ui:message key="welcome-message" /></p>

<hr />

<p><a href="${proceedToFirstForm}"><liferay-ui:icon image="forward" /> <liferay-ui:message key="go-to-form" /></a></p>