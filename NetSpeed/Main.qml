import QtQuick 2.12
import Ubuntu.Components 1.3
import QtWebEngine 1.8
import Ubuntu.Components.Popups 1.3

MainView {
    objectName: "mainView"
    applicationName: "netspeed.turan-mahmudov-l"

    width: units.gu(50)
    height: units.gu(75)

    backgroundColor: "#141526"

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("NetSpeed")
            StyleHints {
                foregroundColor: "#ffffff"
                backgroundColor: "#141526"
                dividerColor: "#1cbfff"
            }
        }
       
        WebEngineView {
            id: webview
            anchors {
               top: pageHeader.bottom
               bottom: parent.bottom
               left: parent.left
               right: parent.right
            }
            visible: false
			profile:  WebEngineProfile{
	    		httpUserAgent: "Mozilla/5.0 (Linux; Android 4.4.4; Nexus 4 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.25 Mobile Safari/537.36"
			}
            userScripts: [
                WebEngineScript {
                    sourceUrl: Qt.resolvedUrl("userscript.js")
                    runOnSubframes: true
                }
            ]
            
            url: "https://fast.com/"

		    settings.localStorageEnabled: true
		    settings.javascriptEnabled: true
		    settings.javascriptCanAccessClipboard: true

            onLoadingChanged: {
                if (loadRequest.status == WebEngineView.LoadSucceededStatus) {
                    webview.visible = true
                }
            }
        }
    }
}
