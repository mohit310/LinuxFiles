   �         :https://cws.connectedpdf.com/js_plugins/cDrm/manifest.json     %�Z �)�     %�OH�         
     O K           �      Server   nginx/1.10.1   Date   Tue, 04 Jul 2017 03:40:49 GMT   Content-Type   application/json   Content-Length   835   Last-Modified   Fri, 30 Jun 2017 09:47:57 GMT   ETag   "59561e4d-343"   Cache-Control   max-age=604800   Accept-Ranges   bytes {
  "manifest_version": 1,
  "name": "cDRM",
  "version": "0.0.1",
  "description": "DRM Plugin",
  "icons": "cDrm/res/panelicon_.png",
  "copyright": "__MSG_extCopyright__",
  "panel":
  {
    "url": "./cDrm/web/index.html?v=06301746,master-16de7c8",
    "title":"__MSG_panelTitle__",
    "tooltip":"__MSG_panelTip__",
    "icon":"cDrm/res/panelicon_.png"
  },
  "toolButtons":[
    {
  "category":"Protect",
  "id":"BUTTON_NAME_JS_PLUGIN_CDRM",
  "text":"__MSG_button1Text__",
  "tip":"__MSG_button1Tip__",
  "position":0,
  "icons":"cDrm/res/icon_.png"
  },
    {
      "category":"Connect",
      "id":"BUTTON_NAME_JS_PLUGIN_CDRM",
      "text":"__MSG_button1Text__",
      "tip":"__MSG_button1Tip__",
      "position":0,
      "icons":"cDrm/res/icon_.png"}],
  "signcode":"",
  "drm_handler" : true,
  "loadflags" : ["cdrmdoc"]
}
