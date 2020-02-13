// Handy methods

S.log('Loading slate config');

/*** Utility functions ***/

function runIf(name, cmd) {
    slate.eachApp(function (app) {
        if (app.name() == name) { return; }
    });
    slate.shell(cmd, false, "~/");
    // positions['centre-top'].dup({ 'app': name }).run();
}

/*** Maps ***/

var positions = {

    "top-half": S.operation("push", {
        "direction": "up",
        "style": "bar-resize:screenSizeY/2"
    }),
    "bottom-half": S.operation("push", {
        "direction": "down",
        "style": "bar-resize:screenSizeY/2"
    }),
    "left-half": S.operation("push", {
        "direction": "left",
        "style": "bar-resize:screenSizeX/2"
    }),
    "right-half": S.operation("push", {
        "direction": "right",
        "style": "bar-resize:screenSizeX/2"
    }),
    "left-quarter": S.operation("push", {
        "direction": "left",
        "style": "bar-resize:screenSizeX/4"
    }),
    "right-quarter": S.operation("push", {
        "direction": "right",
        "style": "bar-resize:screenSizeX/4"
    }),

    "top-left": S.operation("corner", {
        "direction": "top-left",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2",
    }),
    "bottom-left": S.operation("corner", {
        "direction": "bottom-left",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2",
    }),
    "top-right": S.operation("corner", {
        "direction": "top-right",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2",
    }),
    "bottom-right": S.operation("corner", {
        "direction": "bottom-right",
        "width": "screenSizeX/2",
        "height": "screenSizeY/2",
    }),

    "fullscreen": S.operation("move", {
        "x": "0",
        "y": "0",
        "width": "screenSizeX",
        "height": "screenSizeY",
    }),
    "centre": S.operation("move", {
        "x": "screenOriginX+screenSizeX/8",
        "y": "screenOriginY+screenSizeY/8",
        "width": "screenSizeX/8*6",
        "height": "screenSizeY/8*6",
    }),
    "centre-top": S.operation("move", {
        "x": "screenOriginX+screenSizeX/8",
        "y": "0",
        "width": "screenSizeX/8*6",
        "height": "screenSizeY/8*6",
    }),
}

var positionMap = {
    "up:ctrl,cmd":      "top-half",
    "down:ctrl,cmd":    "bottom-half",
    "left:ctrl,cmd":    "left-half",
    "right:ctrl,cmd":   "right-half",
    "left:ctrl,shift,cmd":    "left-quarter",
    "right:ctrl,shift,cmd":   "right-quarter",

    "m:ctrl,cmd":       "fullscreen",
    // "m:f3":       "fullscreen",
    "c:ctrl,cmd":       "centre-top",

    // "1:c,ctrl,alt":     "bottom-right",
    // "2:c,ctrl,alt":     "bottom-left",
    // "3:c,ctrl,alt":     "top-left",
    // "4:c,ctrl,alt":     "top-right",
}

// NB : Application paths must be wrapped in quotes if there are spaces in it
var appMap = {
    "Firefox": {
        "keys": "w:ctrl,alt",
        "cmd": "/usr/bin/open '/Applications/Firefox.app'"
    },

    "Slack": {
        "keys": "s:ctrl,alt",
        "cmd": "/usr/bin/open /Applications/HipChat.app"
    },

    "Sublime Text": {
        "keys": "e:ctrl,alt",
        "cmd": "/usr/bin/open '/Applications/Sublime Text.app'"
    },

    "Twitter": {
        "keys": "t:ctrl,alt",
        "cmd": "/usr/bin/open '/Applications/Night Owl.app'"
    },

    "Sequel Pro": {
        "keys": "d:ctrl,alt",
        "cmd": "/usr/bin/open '/Applications/Sequel Pro.app'"
    },
};

/*** Hook it all up ***/

// Throws
S.bindAll({

    // Resizes
    // "right:f3:toggle"            : S.op("resize", { "width" : "+10%", "height" : "+0" }),
    // "left:f3:toggle"             : S.op("resize", { "width" : "-10%", "height" : "+0" }),
    // // "up:ctrl"               : S.op("resize", { "width" : "+0", "height" : "-10%" }),
    // // "down:ctrl"             : S.op("resize", { "width" : "+0", "height" : "+10%" }),
    // "]:f3:toggle"             : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
    // "[:f3:toggle"              : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
    // // "up:alt"                : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
    // // "down:alt"              : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

    // Throws
    "right:ctrl;alt;cmd"    : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
    "left:ctrl;alt;cmd"     : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
    "up:ctrl;alt;cmd"       : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
    "down:ctrl;alt;cmd"     : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

    // Grid
    "esc:ctrl" : S.op("grid"),

})

S.log('Binding app launchers');
_.each(appMap, function(app, name){
    // S.log("Binding app: " + name);
    S.bind(app.keys, function(win){
        runIf(name, app.cmd);
        S.op("focus", {"app": name})
         .run();
    })
});

S.log('Binding positioning keys')
_.each(positionMap, function(op, key){
    // S.log('Bind position : ' + key);
    S.bind(key, function(win) {
        if (win && !!positions[op]) {
            win.doOperation(positions[op]);
        }
    });
});

S.log('Binding control keys');
S.bind("r:ctrl,shift,cmd", S.operation("relaunch"));

// Log that we finished ok
S.log("Loaded slate config");
