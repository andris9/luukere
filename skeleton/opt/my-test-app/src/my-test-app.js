'use strict';

var log = require('npmlog');
var config = require('config');
var net = require('net');

var server = net.createServer(function(socket) {
    log.info('TCP', 'Connection from %s', socket.remoteAddress);
    socket.write('Echo server\r\n');
    socket.pipe(socket);
});

server.listen(config.port, config.host);