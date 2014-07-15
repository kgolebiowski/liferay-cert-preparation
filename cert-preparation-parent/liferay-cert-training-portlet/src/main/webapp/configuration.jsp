<%@ include file="init.jsp" %>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionUrl" />

<aui:form action="${configurationActionUrl}" method="post">
    <%-- This parameter must be here, otherwise preferences will not be stored!
        (even success message is not shown!)--%>
    <aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />

    <aui:fieldset>
        <aui:input name="preferences--configuration.log-url-generation--"
                   type="checkbox" value="${isLogUrlGenerationEnabled}" />
    </aui:fieldset>

    <aui:button-row>
        <aui:button type="submit" />
    </aui:button-row>
</aui:form>