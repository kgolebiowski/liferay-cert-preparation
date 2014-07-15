package net.mypieceofthe.liferay.certification.portlets;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import net.mypieceofthe.liferay.certification.portlets.model.FormDto;

import javax.portlet.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Locale;
import java.util.ResourceBundle;

/**
     * Created by kgolebiowski on 2014-05-03.
     */
    public class LiferayCertificationTrainingPortlet extends MVCPortlet {

    private static final Log _log = LogFactoryUtil.getLog(LiferayCertificationTrainingPortlet.class);

    @Override
    public void render(RenderRequest request, RenderResponse response) throws PortletException, IOException {

        logRequestParameters(request);

        super.render(request, response);
    }

    @Override
    public void processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, PortletException {

        logRequestParameters(actionRequest);

        super.processAction(actionRequest, actionResponse);
    }

    @Override
    public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse) throws IOException, PortletException {

        logRequestParameters(resourceRequest);

        super.serveResource(resourceRequest, resourceResponse);
    }

    /* Render actions */

    /* Action handlers */

    public void akcja(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {

        // Test action called from v_first.jsp
    }

    public void repeatRenderParametersAction(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {
        actionResponse.setRenderParameter(
                "foo", GetterUtil.getString(actionRequest.getParameter("foo")));
        actionResponse.setRenderParameter(
                WebKeys.MVC_PATH, actionRequest.getParameter(WebKeys.MVC_PATH));
    }

    public void testRedirectParameterAction(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {

    }

    public void testRedirectParamRewriteAction(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {
        actionResponse.setRenderParameter(
                WebKeys.REDIRECT, actionRequest.getParameter(WebKeys.REDIRECT));
    }

    public void getTriggeredActionTest(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {
        actionResponse.setRenderParameter(
                "foobyget", GetterUtil.getString(actionRequest.getParameter("foobyget")));
        actionResponse.setRenderParameter(
                WebKeys.MVC_PATH, actionRequest.getParameter(WebKeys.MVC_PATH));
    }

    public void saveName(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {

        String userName = GetterUtil.getString(actionRequest.getParameter("userName"));

        FormDto dto = (FormDto)actionRequest.getPortletSession().getAttribute(WebKeys.FORM_BEAN_PARAM);

        dto.setUserName(userName);

        actionResponse.setRenderParameter(
                WebKeys.MVC_PATH, actionRequest.getParameter(WebKeys.MVC_PATH));
        actionResponse.setRenderParameter(
                WebKeys.REDIRECT, actionRequest.getParameter("backUrl"));
    }

    public void sendForm(ActionRequest actionRequest, ActionResponse actionResponse)
            throws IOException, PortletException {

    }

    /* Util methods */

    public void logRequestParameters(PortletRequest request) {
        if(request instanceof ActionRequest) {
            _log.info("** Request is type Action (" + ((ActionRequest) request).getMethod() + ")," +
                    " with Action Name '" + request.getParameter(ActionRequest.ACTION_NAME) + "'");
        } else if(request instanceof ResourceRequest)
            _log.info("** Request is type Resource, with ID '" + ((ResourceRequest)request).getResourceID() + "'");
        else if(request instanceof RenderRequest)
            _log.info("** Request is type Render");
        else
            _log.info("** Request type is unknown! Should not happen!");

        Enumeration<String> paramNames = request.getParameterNames();
        while(paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            if(!paramName.equals(ActionRequest.ACTION_NAME))
                _log.info("* Parameter '" + paramName + "': '" + request.getParameter(paramName) + "'");
        }

        _log.info("** Request end\n");
    }

    /* For testing resource bundles and associated portlet.xml settings */
    public void logResourceBundleDebug() {
        String codes[] = new String[] {"pl_PL", "pl", "en_EN", "en"};

        ResourceBundle rb;

        for (String code : codes) {
            rb = this.getResourceBundle(new Locale(code));
            _log.info("welcome-message translation for '" + code + "' is '" + rb.getObject("welcome-message") + "'");

            rb = this.getResourceBundle(LocaleUtil.fromLanguageId(code));
            _log.info("welcome-message translation for '" + code + "' is '" + rb.getObject("welcome-message") + "' (using LocaleUtil)");
        }
    }
}
