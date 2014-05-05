<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="theme" uri="http://liferay.com/tld/theme" %>
<%@ taglib prefix="liferay-portlet" uri="http://liferay.com/tld/portlet" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>

<%@ page import="net.mypieceofthe.liferay.certification.portlets.WebKeys" %>
<%@ page import="com.liferay.portlet.PortletURLUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="javax.portlet.PortletURL" %>

<portlet:defineObjects />
<theme:defineObjects />

<%
    PortletURL currentURLObj = PortletURLUtil.getCurrent(liferayPortletRequest, liferayPortletResponse);
    String currentURL = currentURLObj.toString();
%>