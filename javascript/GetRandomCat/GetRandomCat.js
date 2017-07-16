//Gets a random cat from http://random.cat - for NodeJS
var fs = require('fs'),
    request = require('request');
var sleep = require('sleep-async')();;

function getCat() {
    request
        .get('http://random.cat/meow')
        .on('error', function(err) {
            // handle error
        })
        .pipe(fs.createWriteStream('cat.json'));

    sleep.sleep(1000, function() {
        var contents = fs.readFileSync("cat.json");
        var jsonContent = JSON.parse(contents);
        var kat = jsonContent.file
        console.log(kat);
    })
});
}
