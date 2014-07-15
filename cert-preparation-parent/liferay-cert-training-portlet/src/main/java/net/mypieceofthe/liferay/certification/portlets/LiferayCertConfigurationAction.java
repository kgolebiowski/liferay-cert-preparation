package net.mypieceofthe.liferay.certification.portlets;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portlet.PortletPreferencesFactoryUtil;

import javax.portlet.*;
import java.util.Enumeration;

/**
 * Created by kgolebiowski on 2014-05-16.
 */
public class LiferayCertConfigurationAction extends DefaultConfigurationAction {

    private static final Log _log =
            LogFactoryUtil.getLog(LiferayCertConfigurationAction.class);

    @Override
    public String render(
            PortletConfig portletConfig, RenderRequest renderRequest, RenderResponse renderResponse)
            throws Exception {
        _log.info("render called");

        PortletPreferences prefs = renderRequest.getPreferences();
        String isLogUrlGenerationEnabled = GetterUtil.getString(
                prefs.getValue("configuration.log-url-generation", null));

        _log.info(">> " + isLogUrlGenerationEnabled);

        return super.render(portletConfig, renderRequest, renderResponse);
    }

    @Override
    public void processAction(
            PortletConfig portletConfig, ActionRequest actionRequest, ActionResponse actionResponse)
            throws Exception {
        _log.info("processAction called");

        // Printing preferences (change to guava or something else)
        String portletResource = ParamUtil.getString(actionRequest, "portletResource");
        PortletPreferences prefs =
                PortletPreferencesFactoryUtil.getPortletSetup(actionRequest, portletResource);
        Enumeration<String> names = prefs.getNames();

        if(!names.hasMoreElements())
            _log.info("Current actionRequest contains no preferences!");

        while(names.hasMoreElements()) {
            _log.info("Preference name: '" + names.nextElement() + "'");
        }

        super.processAction(portletConfig, actionRequest, actionResponse);
    }
}
