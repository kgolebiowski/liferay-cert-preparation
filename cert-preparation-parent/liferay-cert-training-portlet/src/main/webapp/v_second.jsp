<%@ include file="init.jsp" %>

<liferay-ui:header
        title="Second form"
        showBackURL="true"
        backURL="<%= ParamUtil.getString(renderRequest, \"redirect\") %>" />

<liferay-portlet:renderURL var="tabRenderUrl" copyCurrentRenderParameters="true" />

<liferay-ui:tabs
        names="Tab 1,Tab 2,Tab 3" url="${tabRenderUrl}">
    <liferay-ui:section>
        <p>Tab 1 content</p>
    </liferay-ui:section>
    <liferay-ui:section>
        <p>Tab 2 content</p>
    </liferay-ui:section>
    <liferay-ui:section>
        <p>Tab 3 content</p>
    </liferay-ui:section>
</liferay-ui:tabs>

<hr />

<liferay-portlet:actionURL name="sendForm" var="sendFormUrl">
</liferay-portlet:actionURL>

<p><a href="${sendFormUrl}"><liferay-ui:icon image="checked" /> Send form</a></p>