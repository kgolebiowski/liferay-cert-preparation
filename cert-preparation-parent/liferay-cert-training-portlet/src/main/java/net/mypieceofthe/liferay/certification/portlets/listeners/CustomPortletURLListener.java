package net.mypieceofthe.liferay.certification.portlets.listeners;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.model.PortletApp;
import com.liferay.portal.model.PortletURLListener;

import javax.portlet.BaseURL;
import javax.portlet.PortletURL;
import javax.portlet.PortletURLGenerationListener;
import javax.portlet.ResourceURL;

/**
 * Created by kgolebiowski on 2014-05-16.
 */
public class CustomPortletURLListener implements PortletURLGenerationListener {

    private static final Log _log = LogFactoryUtil.getLog(CustomPortletURLListener.class);

    public void filterActionURL(PortletURL actionURL) {
        logUrl(actionURL);
    }

    public void filterRenderURL(PortletURL renderURL) {
        logUrl(renderURL);
    }

    public void filterResourceURL(ResourceURL resourceURL) {
        logUrl(resourceURL);
    }

    private void logUrl(BaseURL portletURL) {
//        _log.info("Created URL (" + portletURL.getClass().getSimpleName() + "): " +
//                "'" + portletURL.toString() + "'");
    }
}
