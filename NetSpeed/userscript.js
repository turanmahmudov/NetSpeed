var css = ["html,body{font-family:Ubuntu,sans-serif;background:#141526!important;}*{color:#fff!important;}",
            ".footer-container{display:none!important;}.powered-by-container{display:none!important;}.logo-container{display:none!important;}",
            ".speed-container{margin-top:10vh;}",
            ".usage-info-container{display:none!important;}",
            ".speed-progress-indicator.succeeded{border-color:#1cbfff!important;}",
            ".speed-progress-indicator.in-progress>.spinner{box-shadow:0 .3vh 0 0 #1cbfff !important;}",
            "#show-more-details-link{color:#fff!important;border-color:#fff!important;padding:1.5vh 2vh !important;}"
        ].join("");

var node = document.createElement("style");
node.type = "text/css";
node.appendChild(document.createTextNode(css));
var heads = document.getElementsByTagName("head");
if (heads.length > 0) {
    heads[0].appendChild(node);
} else {
    document.documentElement.appendChild(node);
}
