var Discordie = require("discordie");
var client = new Discordie();


//=======================================================================
function author(id) {
    return "<@" + id + ">";
}

function lowcase(message) {
    return message.toLowerCase();
}

// Bots ID is 234570424170708992
function isowner(id) {
    if (id == "141793632171720704")
        return true;
}



/* Working
function toString(){
var fs = require("fs");
var contents = fs.readFileSync("dummy.json");
var jsonContent = JSON.parse(contents);
var jsonObj = jsonContent.number;
console.log(jsonContent);
console.log(JSON.stringify(jsonContent, null, '\t'));
return jsonContent.number;
}

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".number") {
        e.message.channel.sendMessage("The Number is currently: " + toString());
        console.log(parseInt(" 1", 10));
    }
});

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".add") {
        fs = require('fs');
        e.message.channel.sendMessage("The Number was updated:");
        var numb = parseInt(toString(), 10);
        numb = numb + 1;
        fs.writeFile("dummy.json", "{\"number\":\"" + numb + "\"}", function (err){
          if (err) return console.log("ERROR" + err);
      });
    }
});

*/
/* Working
client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".json") {
      var fs = require("fs");
      var contents = fs.readFileSync("1.json");
      var jsonContent = JSON.parse(contents);
      console.log(jsonContent);
      var search = "Overwatch";
      console.log(parseInt(jsonContent[search], 10));
      jsonContent[search] = parseInt(jsonContent[search], 10) + 1;
      console.log(parseInt(jsonContent[search], 10));
      var search = "Starcraft 2";
      console.log(jsonContent[search]);
      jsonContent[search] = parseInt(jsonContent[search], 10) + 1;
      console.log(jsonContent[search]);
      console.log(JSON.stringify(jsonContent));
      fs.writeFile("1.json", JSON.stringify(jsonContent), function (err){
        if (err) return console.log("ERROR" + err);
    });
    var search = e.message.author.gameName;
    console.log(search);

      }
});
*/

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".register") {
        var fs = require("fs");
        var contents = fs.readFileSync("users.json");
        var jsonContent = JSON.parse(contents);
        var user = JSON.stringify(jsonContent.users);
        var user = user.replace("\"", "");
        var users = user.replace("\"", "");
        var res = users.split(",");
        var length = res.length;
        //console.log("----" + length);
        if (res.indexOf(e.message.author.id) == -1) {
            res[length] = e.message.author.id;
            fs.writeFile(e.message.author.id + ".json", "{\"Overwatch\":98}", function(err) {
                if (err) return console.log("ERROR" + err);
            });
            e.message.channel.sendMessage("Successfully Added, Your game play time will now be tracked");
        } else {
            e.message.channel.sendMessage("Playtime already being recorded");
        }
        var output = res.join();
        //console.log("0-" + res[0]);
        //console.log("1-" + res[1]);
        //console.log("2-" + res[2]);
        jsonContent.users = output;
        //console.log("output-" + jsonContent.users);
        fs.writeFile("users.json", JSON.stringify(jsonContent), function(err) {
            if (err) return console.log("ERROR" + err);
        });
    }
});


function updateGames() {
    var fs = require("fs");
    var contents = fs.readFileSync("users.json");
    var jsonContent = JSON.parse(contents);
    var user = JSON.stringify(jsonContent.users);
    var user = user.replace("\"", "");
    var users = user.replace("\"", "");
    var res = users.split(",");
    var length = res.length;
    var i = 0;
    while (i < length) {
        var currentUser = res[i];
        var userinfo = client.Users.get(currentUser);
        //console.log(userinfo.username);
        //console.log(userinfo.gameName);
        var currentGame = userinfo.gameName;
        var contents2 = fs.readFileSync(currentUser + ".json");
        var jsonContent2 = JSON.parse(contents2);
        if (currentGame != null) {
            if (jsonContent2[currentGame] == NaN) {
                jsonContent2[currentGame] = 0;
            }
            if (jsonContent2[currentGame] == null) {
                jsonContent2[currentGame] = 0;
            }
            jsonContent2[currentGame] = parseInt(jsonContent2[currentGame], 10) + 1;
            //console.log(jsonContent2[currentGame]);
            fs.writeFile(currentUser + ".json", JSON.stringify(jsonContent2), function(err) {
                if (err) return console.log("ERROR" + err);
            });
        }
        //console.log("..");
        i = i + 1;
    }
    i = 0;

}
client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".lastgame") {
        var fs = require("fs");
        try {
            var currentGame4 = e.message.author.previousGameName;
            var contents4 = fs.readFileSync(e.message.author.id + ".json");
            var jsonContent4 = JSON.parse(contents4);
            var min4 = jsonContent4[currentGame4];
            var hours4 = 0;
            while (min4 > 60) {
                min4 = min4 - 60;
                hours4 = hours4 + 1;
            }
            if (hours4 >= 1) {
                e.message.channel.sendMessage("You have played " + currentGame4 + " for " + hours4 + " hour/s " + min4 + "min");
            } else {
                e.message.channel.sendMessage("You have played " + currentGame4 + " for " + min4 + "min");
            }
        } catch (err) {
            e.message.channel.sendMessage("Error, have you played this game before or signed up?");
        }
    }
});

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (/^\.game/g.test(lowcase(e.message.content))) {
        var fs = require("fs");
        var command = e.message.content.replace(/\.game\s/i, "");
        if (lowcase(e.message.content) == ".game") {
            if (e.message.author.gameName == null) {
                try {
                    var contents4 = fs.readFileSync(e.message.author.id + ".json");
                    e.message.channel.sendMessage("Please launch the game, then run this command to see its playtime");
                } catch (e) {
                    e.message.channel.sendMessage("Error, have you played this game before or signed up?");
                }
            } else {
                try {
                    var currentGame3 = e.message.author.gameName;
                    var contents3 = fs.readFileSync(e.message.author.id + ".json");
                    var jsonContent3 = JSON.parse(contents3);
                    //console.log("xxxxx");
                    //console.log(e.message.author.gameName);
                    //console.log(currentGame3);
                    var min3 = jsonContent3[currentGame3];
                    var hours3 = 0;
                    while (min3 > 60) {
                        min3 = min3 - 60;
                        hours3 = hours3 + 1;
                    }
                    if (hours3 >= 1) {
                        e.message.channel.sendMessage("You have played " + currentGame3 + " for " + hours3 + " hour/s " + min3 + "min");
                    } else {
                        e.message.channel.sendMessage("You have played " + currentGame3 + " for " + min3 + "min");
                    }
                } catch (err) {
                    e.message.channel.sendMessage("Error, have you played this game before or signed up?");
                }
            }
        } else if (command != null) {
            try {
                //console.log("game - " + command);
                var currentGame3 = command;
                var contents3 = fs.readFileSync(e.message.author.id + ".json");
                var jsonContent3 = JSON.parse(contents3);
                if (jsonContent3[currentGame3] == null) {
                    e.message.channel.sendMessage("Either no time has been recorded, or the game is not spelt as it appears in Discord (capital sensitive)");
                } else if (jsonContent3[currentGame3] != null) {
                    var min3 = jsonContent3[currentGame3];
                    var hours3 = 0;
                    while (min3 > 60) {
                        min3 = min3 - 60;
                        hours3 = hours3 + 1;
                    }
                    if (hours3 >= 1) {
                        e.message.channel.sendMessage("You have played " + currentGame3 + " for " + hours3 + " hour/s " + min3 + "min");
                    } else {
                        e.message.channel.sendMessage("You have played " + currentGame3 + " for " + min3 + "min");
                    }
                }
            } catch (err) {
                e.message.channel.sendMessage("Error, have you played this game before or signed up?");
            }
        }

    }
});








//=======================================================================

//=======================================================================
client.connect({
    token: "MjM0NTcwNDI0MTcwNzA4OTky.Ctyd4g.cQFMgs_WSWXzGA-Naj4gWOPvx8w"
});

client.Dispatcher.on("GATEWAY_READY", e => {
    console.log("Connected as: " + client.User.username);
    console.log("--------------------------------------");
});
//=======================================================================






//=======================================================================

client.Dispatcher.on("MESSAGE_CREATE", e => {
    console.log("Author ID: " + e.message.author.id + "   User: " + e.message.author.username);
    console.log("Channel ID: " + e.message.channel_id + "   Channel Name: " + e.message.channel.name);
    console.log("Message: " + e.message.content);
    console.log("Guild ID: " + e.message.guild.id + "   Guild Name: " + e.message.guild.name);
    console.log("--------------------------------------");
    if (lowcase(e.message.content) == ".ping") { // Alive Check
        e.message.channel.sendMessage("pong " + author(e.message.author.id));
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".leave") {
        if (isowner(e.message.author.id)) {
            var guild = client.Guilds.get(e.message.guild.id);
            guild.leave();
        }
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".avatar") {
        e.message.channel.sendMessage("Please use `.avatar @username`");
    }
    if (/^\.avatar/g.test(lowcase(e.message.content))) {
        var array = e.message.content.split(" ");
        if (array[1].charAt(2) == "!")
            var res = array[1].slice(3, 21);
        else
            var res = array[1].slice(2, 20);
        var user = client.Users.get(res);
        e.message.channel.sendMessage(author(user.id) + "'s avatar: " + user.avatarURL);
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".catgirl") {
        var random = Math.floor((Math.random() * 86) + 1);
        e.message.channel.uploadFile("images/catgirls/" + random + ".jpg", null, "enjoy " + author(e.message.author.id));
    }
});


//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".waitwhat") {
        e.message.channel.uploadFile("images/waitwhat.gif", null, "");
    }
});

//---------------------------------------------------------------


client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".alter") {
        var random = Math.floor((Math.random() * 62) + 1);
        e.message.channel.uploadFile("images/alter/" + random + ".jpg", null, "enjoy " + author(e.message.author.id));
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".run") {
        e.message.channel.uploadFile("images/weoutofhere.gif", null, "Run! " + author(e.message.author.id));
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".zerg") {
        e.message.channel.uploadFile("images/zerg.gif", null, "Gnaws~ " + author(e.message.author.id));
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".big") {
        e.message.channel.sendMessage("Please add text to be 'biggified'");
    } else if (/^\.big/g.test(lowcase(e.message.content))) {
        var output = e.message.content.replace(/\.big\s/i, "");
        output = output.toUpperCase();
        e.message.channel.sendMessage("***" + output + "***");
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".fail") {
        e.message.channel.sendMessage("▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\n" + "████▌▄▌▄▐▐▌█████\n" + "████▌▄▌▄▐▐▌▀████\n" + "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀");
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".killme") {
        e.message.channel.sendMessage(author(e.message.author.id) + ":boom::gun:");
    }
});

//---------------------------------------------------------------

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".roll") {
        e.message.channel.sendMessage("Please put a number");
    } else if (/^\.roll/g.test(lowcase(e.message.content))) {
        var numb = e.message.content.replace(/\.roll\s/i, "");
        if (/^[0-9]{1,20}$/.test(numb)) {
            var random = Math.floor((Math.random() * numb) + 1);
            if (numb <= 0) {
                random = 0;
            }
            e.message.channel.sendMessage(author(e.message.author.id) + " has rolled a " + random + " out of " + numb);
        } else {
            e.message.channel.sendMessage(author(e.message.author.id) + " Please enter a number");
        }
    }
});
//=======================================================================









//=======================================================================

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (isowner(e.message.author.id)) {
        if (e.message.content == ".setstatus") {
            e.message.channel.sendMessage("please use `.setstatus <online/idle> <game>`");
        } else if (/^\.setstatus/g.test(lowcase(e.message.content))) {
            var array = e.message.content.split(" ");
            var status = array[1];
            array.shift();
            var game = array.join(" ");
            if (lowcase(status) == "online" || status == "idle" || status == "dnd" || status == "offline") {
                array.shift();
                var game = array.join(" ");
                client.User.setStatus(status, game);
                e.message.channel.sendMessage("Now " + status.charAt(0).toUpperCase() + status.slice(1, 20) + " and Playing " + game);
            } else {
                client.User.setGame(game);
                e.message.channel.sendMessage("Now Playing " + game);
            }
        }
    }
});
/*
client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (isowner(e.message.author.id)) {
        if (lowcase(e.message.content) == ".love")
            e.message.channel.sendMessage("I saw that you were perfect, and so I loved you. Then I saw that you were not perfect and I loved you even more. <3 " + author(e.message.author.id));
    }
});

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".cyaninfo") {
        e.message.channel.sendMessage(" Steam - `http://steamcommunity.com/id/cyan101/`  Discord - `Cyan#3717`   League - `Cyanogen101`");
    }
});
*/
client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (/141793632171720704/g.test(e.message.content)) {
        if (e.message.author.id != 234570424170708992 && e.message.author.id != 141793632171720704) {
            var user = client.Users.get("141793632171720704");
            var d = new Date();
            var time = d.getDate() + "/" + d.getMonth() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + " GMT+8";
            if (user.status == "idle") {
                user.openDM().then(dm => dm.sendMessage("You were mentioned: \n" + e.message.content + "\n by " + e.message.author.username + " at  " + time));
                e.message.channel.sendMessage("Sorry " + author(e.message.author.id) + ", But Master isn't at the Computer right now");
            } else if (user.status == "dnd") {
                user.openDM().then(dm => dm.sendMessage("You were mentioned: \n" + e.message.content + "\n by " + e.message.author.username + " at  " + time));
                e.message.channel.sendMessage("Sorry " + author(e.message.author.id) + ", Master is currently on Do Not Disturb, Please leave him be");
            } else if (user.status == "offline") {
                user.openDM().then(dm => dm.sendMessage("You were mentioned: \n" + e.message.content + "\n by " + e.message.author.username + " at  " + time));
                e.message.channel.sendMessage("Sorry " + author(e.message.author.id) + ", But Master is offline (most likely asleep or on mobile)");
            }
        }
    }
});

//=======================================================================

client.Dispatcher.on("MESSAGE_CREATE", e => {
    if (lowcase(e.message.content) == ".uptime") {
        e.message.channel.sendMessage(author("234570424170708992") + " has been running for " + printtime());
    }
});


function printtime() {
    var timeoutput = "";
    if (uptimeday >= 1) {
        timeoutput = uptimeday + " Days, ";
    }
    if (uptimehour >= 1) {
        timeoutput = timeoutput + uptimehour + " Hours, ";
    }
    timeoutput = timeoutput + uptime + " Min";
    return timeoutput;
}

var minutes = 1,
    the_interval = minutes * 60 * 1000;
var uptime = 0;
var uptimehour = 0;
var uptimeday = 0;

setInterval(function() {
    updateGames();
    uptime = uptime + 1;
    if (uptime >= 60) {
        uptime = uptime - 60;
        uptimehour = uptimehour + 1;
    }
    if (uptimehour >= 60) {
        uptimehour = uptimehour - 60;
        uptimeday = uptimeday + 1;
    }
}, the_interval);

//=======================================================================
