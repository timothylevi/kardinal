// change-it
// js/api/embed.site.api.js

(function() {

    var getA = function(url) {
        // getting a object from url string, strongly kludged

        var a = document.createElement('a');
        a.href = url;

        return a;
    };

    var getParams = function(url) {
        // create dict with embed params

        var params = {a: getA(url)};
        if (url.indexOf("?") > -1) {
            var strQueryString = url.substr(url.indexOf("?")),
                aQueryString = strQueryString.split("&");
            for (var i = 0; i < aQueryString.length; i++) {
                var param = aQueryString[i].replace('?', '').split('=');
                params[param[0]] = param[1];
            }
        }

        return params;
    };

    var checkApiVersion = function(version) {
        // check is embed api version correct

        var supportedVersions = ['1.0'];
        if(typeof version != "string") {
            version = version.toFixed(1);
        }

        return !(supportedVersions.indexOf(version) == -1);
    };

    var randomString = function(length) {
        // generate random string

        var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiklmnopqrstuvwxyz'.split(''),
            str = '';

        if (!length) {
            length = Math.floor(Math.random() * chars.length);
        }

        for (var i = 0; i < length; i++) {
            str += chars[Math.floor(Math.random() * chars.length)];
        }

        return str;
    };

    var validateParams = function(params) {  // validate embed iframe params

        params.id = randomString(16);  // add unique id string to widget
        if (!params.prefix) {
            params.prefix = 'change-it';
        }
        if (!params.div) {  // create embed iframe div id
            params.div = params.prefix + '-div-' + params.id;
        }

        if (!parseInt(params.width, 10) && params.width != "auto") {
            params.width = 800;
            console.error('Only integers numbers or "auto" is allowed for embed width')
        }

        return params;
    };

    // installers caller by version
    var embed = {
        // v1.0
        '1.0': function($el, params) {
            params = validateParams(params);
            var $wrapper = document.getElementById(params.div),
                url = params.url + '?embed=true';
            if (!$wrapper) {
                $wrapper = document.createElement('div');
                $wrapper.setAttribute('id', params.div);
                $el.parentNode.insertBefore($wrapper, $el);
            }
            var $iframe = document.createElement('iframe');
            $iframe.setAttribute('id', params.prefix + '-div-' + params.id);
            $iframe.setAttribute('name', params.prefix + '-div-' + params.id);
            $iframe.setAttribute('src', url);
            $iframe.setAttribute('scrolling', 'no');
            $iframe.setAttribute('height', '100%');
            // decide iframe width
            if (params.width == 'auto') {
                $iframe.style.width = '100%';
            } else {
                $iframe.style.width = params.width + 'px';
            }
            $iframe.style.border = 'none';
            $iframe.style.overflow = 'hidden';
            $iframe.style.height = '100%';
            $iframe.style.minHeight = '100%';
            $iframe.frameBorder = 0;
            $wrapper.appendChild($iframe);
        }
    };

    // global vars
    if(!window.EMBEDS) {  // site embed API
        window.EMBEDS = {};
    }

    var EMBEDS = window.EMBEDS;
    // keep track which embeds we have already processed
    if(!EMBEDS.foundEls) {
        EMBEDS.foundEls = [];
    }
    if(!EMBEDS.foundParams) {
        EMBEDS.foundParams = [];
    }

    var foundEls = EMBEDS.foundEls,
        foundParams = EMBEDS.foundParams;

    var $els = document.getElementsByTagName('script');
    var re = /.*embed\.site\.api\.([^/]+\.)?js/;

    for(var i = 0; i < $els.length; i++) {
        var $el = $els[i];
        if($el.src.match(re) && foundEls.indexOf($el) < 0) {
            var params = getParams($el.src);
            if (checkApiVersion(params.version)) {
                foundEls.push($el);
                foundParams.push(params);
                embed[params.version]($el, params);
            }
        }
    }

}(this));

