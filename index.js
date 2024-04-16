import https from "https";
import http from 'http';
import url from "url";
import fs from "fs";

https.createServer({
	key: fs.readFileSync('ssl/if-you-dont-like-me-you-can-commit-suicide.qwq.pink.key'),
	cert: fs.readFileSync('ssl/if-you-dont-like-me-you-can-commit-suicide.qwq.pink.pem'),
}, (req, res) => {
	res.setHeader("Content-Type", "text/plain; charset=UTF-8");
	//res.setHeader("Content-Disposition", 'attachment; filename="oh.sh"');
	res.write(fs.readFileSync("oh.sh"));
	res.end();
}).listen(443);

http.createServer((req, res) => {
        res.writeHead(301, {'Location' : 'https://if-you-dont-like-me-you-can-commit-suicide.qwq.pink/'});
        res.end();
}).listen(80);

console.log("server listen on 80, 443");
