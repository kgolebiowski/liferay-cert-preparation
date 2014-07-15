<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="theme" uri="http://liferay.com/tld/theme" %>
<%@ taglib prefix="liferay-portlet" uri="http://liferay.com/tld/portlet" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>

<%@ page import="com.liferay.portal.kernel.util.Constants" %>
<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portlet.PortletURLUtil" %>
<%@ page import="net.mypieceofthe.liferay.certification.portlets.WebKeys" %>
<%@ page import="net.mypieceofthe.liferay.certification.portlets.formExceptions.UserNameException" %>
<%@ page import="net.mypieceofthe.liferay.certification.portlets.model.FormDto" %>
<%@ page import="javax.portlet.PortletPreferences" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="java.util.Enumeration" %>

<portlet:defineObjects />
<theme:defineObjects />

<%
    /* Obtain and store in pageContext currentURL and redirect */

    PortletURL currentURLObj = PortletURLUtil.getCurrent(liferayPortletRequest, liferayPortletResponse);
    String currentURL = currentURLObj.toString();
    pageContext.setAttribute("currentURL", currentURL);

    String redirect = ParamUtil.getString(renderRequest, "redirect");
    pageContext.setAttribute("redirect", redirect);

    /* Read and store in pageContext Portlet Preferences */

    PortletPreferences preferences = renderRequest.getPreferences();

    String isLogUrlGenerationEnabled = GetterUtil.getString(
            preferences.getValue("configuration.log-url-generation", null));
    pageContext.setAttribute("isLogUrlGenerationEnabled", isLogUrlGenerationEnabled);

    /* Obtain FormDto */
    FormDto formDto;
    Object formDtoObj = renderRequest.getPortletSession().getAttribute(WebKeys.FORM_BEAN_PARAM);
    if(formDtoObj != null)
        formDto = (FormDto)formDtoObj;
    else {
        formDto = new FormDto();
        renderRequest.getPortletSession().setAttribute(WebKeys.FORM_BEAN_PARAM, formDto);
    }

    pageContext.setAttribute("formDto", formDto);
%>

<script type="text/javascript">
    AUI().use('aui-base','aui-dialog', function(A) {

        var renderParametersContent = A.one('#<portlet:namespace />display-parameters-popup');

        A.one('#<portlet:namespace />display-parameters-button').on('click', function(event) {
            var dialog = new A.Dialog({
                title: 'Display Render Parameters',
                bodyContent: renderParametersContent,
                centered: true,
                modal: true,
                width: 700,
                height: 400
            }).render();

            renderParametersContent.show()
        });
    });
</script>

<div id="<portlet:namespace />display-parameters-popup" style="float: left" class="aui-helper-hidden">
    <% Enumeration<String> paramNames = renderRequest.getParameterNames();
        while(paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            pageContext.setAttribute("paramName", paramName);
            pageContext.setAttribute("paramValue", GetterUtil.getString(renderRequest.getParameter(paramName)));
    %>
        <p><b>${paramName}</b> : ${paramValue}</p>
    <%
        }
    %>
</div>

<aui:button name="display-parameters-button" value="Display Render Parameters" style="float: right; margin-left: 10px" icon="add" />

<%--<aui:button-item icon="info" buttonitemId="test123" />--%>