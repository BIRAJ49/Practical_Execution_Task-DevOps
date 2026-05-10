const http = require('http');
const fs = require('fs');
const path = require('path');

const port = process.env.PORT || 3000;
const indexPath = path.join(__dirname, 'index.html');

const server = http.createServer((req, res) => {
    if (req.url === '/health') {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ status: 'ok' }));
        return;
    }

    if (req.url === '/' || req.url === '/index.html') {
        fs.readFile(indexPath, (err, data) => {
            if (err) {
                res.writeHead(500, { 'Content-Type': 'text/plain' });
                res.end('Application failed to load index.html');
                return;
            }

            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.end(data);
        });
        return;
    }

    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
});

server.listen(port, () => {
    console.log(`Application running on port ${port}`);
});
