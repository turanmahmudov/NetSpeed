import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Web 0.2
import com.canonical.Oxide 1.14 as Oxide

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

        WebContext {
            id: webcontext
            userAgent: "Mozilla/5.0 (Linux; Android 4.4.4; Nexus 4 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.25 Mobile Safari/537.36"
            userScripts: [
                Oxide.UserScript {
                    context: "oxide://"
                    url: Qt.resolvedUrl("userscript.js")
                    matchAllFrames: true
                }
            ]
        }

        WebView {
            id: webview
            anchors {
               top: pageHeader.bottom
               bottom: parent.bottom
               left: parent.left
               right: parent.right
            }

            context: webcontext
            url: "https://fast.com/"
            preferences.localStorageEnabled: true
            preferences.appCacheEnabled: true
            preferences.javascriptCanAccessClipboard: true
            preferences.allowFileAccessFromFileUrls: true
            preferences.allowUniversalAccessFromFileUrls: true
        }
    }
}
