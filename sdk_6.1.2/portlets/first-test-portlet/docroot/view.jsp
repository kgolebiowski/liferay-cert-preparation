<%@ include file="init.jsp" %>

<liferay-portlet:renderURL var="proceedToFirstForm">
    <liferay-portlet:param name="mvcPath" value="/v_first.jsp" />
    <liferay-portlet:param name="redirect" value="<%= currentURL %>" />
</liferay-portlet:renderURL>

<liferay-ui:header
        title="Welcome to Liferay Certification training app"
        backURL="siema" />

<p>Welcome to training app, please click "Proceed to first form"</p>

<hr />

<p><a href="${proceedToFirstForm}"><liferay-ui:icon image="forward" /> Proceed to first form</a></p>