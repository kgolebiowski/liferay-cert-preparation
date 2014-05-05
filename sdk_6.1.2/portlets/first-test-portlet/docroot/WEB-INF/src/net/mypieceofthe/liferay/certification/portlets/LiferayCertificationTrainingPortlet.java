package net.mypieceofthe.liferay.certification.portlets;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import javax.portlet.*;
import java.io.IOException;

/**
 * Created by kgolebiowski on 2014-05-03.
 */
public class LiferayCertificationTrainingPortlet extends MVCPortlet {

    private static final Log _log = LogFactoryUtil.getLog(LiferayCertificationTrainingPortlet.class);

    @Override
    public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
            throws IOException, PortletException {

        _log.info("'doView' called");

        _log.info("Parametr test-param w requescie: " + renderRequest.getParameter(WebKeys.TEST_PARAM));

        super.doView(renderRequest, renderResponse);
    }

    @Override
    public void processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, PortletException {
        _log.info("Action '" + ParamUtil.getString(actionRequest, ActionRequest.ACTION_NAME) + "' called");
        super.processAction(actionRequest, actionResponse);
    }

    public void akcja(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, PortletException {
//        _log.info("Parametr test-param w requescie: " + actionRequest.getParameter(WebKeys.TEST_PARAM));
    }

    public void sendForm(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, PortletException {
        _log.info("Parametr test-param w requescie: " + actionRequest.getParameter(WebKeys.TEST_PARAM));
    }

    @Override
    public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse) throws IOException, PortletException {
        _log.info("Resource '" + resourceRequest.getResourceID() + "' called");

        _log.info("Parametr test-param w requescie: " + resourceRequest.getParameter(WebKeys.TEST_PARAM));

        super.serveResource(resourceRequest, resourceResponse);
    }
}
