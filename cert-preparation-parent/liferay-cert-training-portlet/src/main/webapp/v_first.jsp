<%@ include file="init.jsp" %>

<liferay-ui:header
        title="first-form.header"
        showBackURL="true"
        backURL='${redirect}' />

<h2>ActionURLs</h2>

<div>
    <h3>Case 1 (proceed to the next view)</h3>
    <p style="font-weight: bold">This is the proper form, allowing you to proceed to the next part of the
    tutorial.</p>

    <liferay-portlet:actionURL name="saveName" var="saveNameUrlCase1">
        <liferay-portlet:param name="backUrl" value="${currentURL}" />
        <liferay-portlet:param name="<%= WebKeys.MVC_PATH %>" value="/v_second.jsp" />
    </liferay-portlet:actionURL>

    <aui:form action="${saveNameUrlCase1}" method="post" name="fm">

        <aui:model-context bean="<%= formDto %>" model="<%= FormDto.class %>" />

        <liferay-ui:error exception="<%= UserNameException.class %>" message="please-enter-valid-username" />

        <aui:fieldset>
            <aui:input name="userName" type="text" label="first-form.username-label" />
            <aui:button name="saveButton" type="submit" value="Save" />
        </aui:fieldset>

    </aui:form>
</div>

<hr />

<div>
    <h3>Case 2 - standard behaviour</h3>
    <p style="font-weight: bold">This code will add single render parameter to <i>ActionURL</i> and then
    sets it again in <i>repeatRenderParametersAction</i> portlet action method</p>

    <p>Action URL code: </p>
    <pre class="code">
&#x3C;liferay-portlet:actionURL name=&#x22;repeatRenderParametersAction&#x22; var=&#x22;repeatRenderParametersActionUrl&#x22;&#x3E;
    &#x3C;liferay-portlet:param name=&#x22;&#x3C;%= WebKeys.MVC_PATH %&#x3E;&#x22; value=&#x22;/v_second.jsp&#x22; /&#x3E;
    &#x3C;liferay-portlet:param name=&#x22;foo&#x22; value=&#x22;bar&#x22; /&#x3E;
&#x3C;/liferay-portlet:actionURL&#x3E;
    </pre>

    <p>Action method: </p>
    <pre class="code">
actionResponse.setRenderParameter(
        "foo", GetterUtil.getString(actionRequest.getParameter("foo")));
actionResponse.setRenderParameter(
        WebKeys.MVC_PATH, actionRequest.getParameter(WebKeys.MVC_PATH));
    </pre>

    <liferay-portlet:actionURL name="repeatRenderParametersAction" var="repeatRenderParametersActionUrl">
        <liferay-portlet:param name="<%= WebKeys.MVC_PATH %>" value="/v_first.jsp" />
        <liferay-portlet:param name="foo" value="bar" />
    </liferay-portlet:actionURL>

    <% if(renderRequest.getParameter("foo") != null) { %>
        <div class="portlet-msg-alert">Got the following 'foo' parameter value = '${renderRequest.getParameter("foo")}'</div>
    <% } %>

    <aui:form action="${repeatRenderParametersActionUrl}" method="post" name="fm">

        <aui:fieldset>
            <aui:button name="submit" type="submit" value="submit" />
        </aui:fieldset>

    </aui:form>
</div>

<hr />

<div>
    <h3>Case 3 - positive 'redirect'</h3>
    <p style="font-weight: bold">In this case, the action is performed and then, due to the 'redirect' parameter,
        the form returns back to <u>exactly</u> this URL. <u>All parameters set in this ActionURL are then ignored.</u>
        Action class is empty, if one tries to use actionResponse.setRenderParameter, then
        <i>java.lang.IllegalStateException: Set render parameter has already been called</i> will be thrown
        (see next case).</p>

    <p>Action URL code: </p>
    <pre class="code">
&#x3C;liferay-portlet:actionURL name=&#x22;testRedirectParameterAction&#x22; var=&#x22;testRedirectParameterActionUrl&#x22;&#x3E;
    &#x3C;liferay-portlet:param name=&#x22;&#x3C;%= WebKeys.REDIRECT %&#x3E;&#x22; value=&#x22;\${currentURL}&#x22; /&#x3E;
&#x3C;/liferay-portlet:actionURL&#x3E;
    </pre>

    <liferay-portlet:actionURL name="testRedirectParameterAction" var="testRedirectParameterActionUrl">
        <liferay-portlet:param name="<%= WebKeys.REDIRECT %>" value="${currentURL}" />
    </liferay-portlet:actionURL>

    <aui:form action="${testRedirectParameterActionUrl}" method="post" name="fm">

        <aui:fieldset>
            <aui:button name="submit" type="submit" value="submit" />
        </aui:fieldset>

    </aui:form>
</div>

<hr />

<div>
    <h3>Case 4 - negative 'redirect'</h3>
    <p style="font-weight: bold">Similar case to previous one, but in here the 'redirect' parameter is re-set in
        action method which causes <i>java.lang.IllegalStateException: Set render parameter has already been called</i> error.</p>

    <p>Action URL code: </p>
    <pre class="code">
&#x3C;liferay-portlet:actionURL name=&#x22;testRedirectParamRewriteAction&#x22; var=&#x22;testRedirectParameterActionUrl&#x22;&#x3E;
    &#x3C;liferay-portlet:param name=&#x22;&#x3C;%= WebKeys.REDIRECT %&#x3E;&#x22; value=&#x22;\${currentURL}&#x22; /&#x3E;
&#x3C;/liferay-portlet:actionURL&#x3E;
    </pre>

    <p>Action method: </p>
    <pre class="code">
actionResponse.setRenderParameter(
        WebKeys.REDIRECT, actionRequest.getParameter(WebKeys.REDIRECT));
    </pre>

    <liferay-portlet:actionURL name="testRedirectParamRewriteAction" var="testRedirectParamRewriteActionUrl">
        <liferay-portlet:param name="<%= WebKeys.REDIRECT %>" value="${currentURL}" />
    </liferay-portlet:actionURL>

    <aui:form action="${testRedirectParamRewriteActionUrl}" method="post" name="fm">

        <aui:fieldset>
            <aui:button name="submit" type="submit" value="submit" />
        </aui:fieldset>

    </aui:form>
</div>

<hr />

<div>
    <h3>Case 5 - ActionURL used in GET</h3>
    <p style="font-weight: bold">....</p>

    <p>Action URL code: </p>
    <pre class="code">&#x3C;liferay-portlet:actionURL name=&#x22;getTriggeredActionTest&#x22; var=&#x22;getTriggeredActionTestUrl&#x22;&#x3E;
    &#x3C;liferay-portlet:param name=&#x22;&#x3C;%= WebKeys.MVC_PATH %&#x3E;&#x22; value=&#x22;/v_first.jsp&#x22; /&#x3E;
&#x3C;/liferay-portlet:actionURL&#x3E;</pre>

    <p>Action method code: </p>
    <pre class="code">actionResponse.setRenderParameter(
    WebKeys.MVC_PATH, actionRequest.getParameter(WebKeys.MVC_PATH));</pre>

    <liferay-portlet:actionURL name="getTriggeredActionTest" var="getTriggeredActionTestUrl">
        <liferay-portlet:param name="<%= WebKeys.MVC_PATH %>" value="/v_first.jsp" />
        <liferay-portlet:param name="foobyget" value="bar by GET" />
    </liferay-portlet:actionURL>

    <% if(renderRequest.getParameter("foobyget") != null) { %>
    <div class="portlet-msg-alert">Got the following 'fofoobyget' parameter value = '${renderRequest.getParameter("foobyget")}'</div>
    <% } %>

    <p>(<a href="${getTriggeredActionTestUrl}">link</a>)</p>
</div>

<hr />

<h2>Render URLs</h2>

<div>
    <p style="font-weight: bold">Standard RenderURL</p>
    <pre clas="code">&lt;liferay-portlet:renderURL var="simpleRenderUrl" /&gt;</pre>

    <liferay-portlet:renderURL var="simpleRenderUrl" />

    <p>(<a href="${simpleRenderUrl}">link</a>)</p>
</div>

<hr />

<div>
    <p style="font-weight: bold">Standard RenderURL preserving current render parameters</p>
    <pre clas="code">&lt;liferay-portlet:renderURL var="renderUrlWithCopyCurr" copyCurrentRenderParameters="true" /&gt;</pre>

    <liferay-portlet:renderURL var="renderUrlWithCopyCurr" copyCurrentRenderParameters="true" />

    <p>(<a href="${renderUrlWithCopyCurr}">link</a>)</p>
</div>

<hr />

<h2>Notes</h2>

<div class="portlet-msg-info">When calling actionRequest through POST, all parameters passed via liferay-portlet:param
    tag are preserved until RENDER phase. If actionRequest is called with GET, parameters are lost at next RENDER.<br />
    Check submitting form at the top (POST) and the link above (GET).</div>

<div class="portlet-msg-info">
    If any of actionResponse.setRenderParameters is null, portlet container will throw the following exception:<br />
    <pre>
11:34:44,283 ERROR [ajp-bio-8009-exec-36][render_portlet_jsp:157] java.lang.IllegalArgumentException
    at com.liferay.portlet.StateAwareResponseImpl.setRenderParameter(StateAwareResponseImpl.java:177)</pre>
</div>