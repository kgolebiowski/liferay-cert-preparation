<%@ include file="init.jsp" %>

<liferay-ui:header
        title="First form"
        showBackURL="true"
        backURL="<%= ParamUtil.getString(renderRequest, \"redirect\") %>" />

<p>You are in First View!</p>

<liferay-portlet:actionURL name="akcja" var="actionTest" copyCurrentRenderParameters="true">
    <liferay-portlet:param name="<%= WebKeys.TEST_PARAM %>" value="testParamValueFromAction" />
</liferay-portlet:actionURL>

<div>
    <p>
        <pre class="code">
&lt;liferay-portlet:actionURL name=&quot;akcja&quot; var=&quot;actionTest&quot; copyCurrentRenderParameters=&quot;true&quot;&gt;
    &lt;liferay-portlet:param name=&quot;&lt;%= WebKeys.TEST_PARAM %&gt;&quot; value=&quot;testParamValueFromAction&quot; /&gt;
&lt;/liferay-portlet:actionURL&gt;
        </pre>
        <br />(<a href="${actionTest}">link</a>)
    </p>
</div>

<liferay-portlet:renderURL var="renderUrlWithCopyCurr" copyCurrentRenderParameters="true" />

<div>
    <p>
        <pre clas="code">&lt;liferay-portlet:renderURL var="renderUrlWithCopyCurr" copyCurrentRenderParameters="true" /&gt;</pre>
        <br />(<a href="${renderUrlWithCopyCurr}">link</a>)
    </p>
</div>

<liferay-portlet:renderURL var="simpleRenderUrl" />

<div>
    <p><pre clas="code">&lt;liferay-portlet:renderURL var="simpleRenderUrl" /&gt;</pre>
        <br />(<a href="${simpleRenderUrl}">link</a>)
    </p>
</div>

<hr />

<liferay-portlet:renderURL var="proceedToSecondForm">
    <liferay-portlet:param name="mvcPath" value="/v_second.jsp" />
    <liferay-portlet:param name="redirect" value="<%= currentURL %>" />
</liferay-portlet:renderURL>

<p><a href="${proceedToSecondForm}"><liferay-ui:icon image="forward" /> Proceed to second form</a></p>