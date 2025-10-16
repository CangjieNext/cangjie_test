/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#request
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import {asan.*, tlsconfig.*}
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.convert.*

@Test
class TestClient1_1Request {
    // http url without port or proxy
    @TestCase
    func client1_1HttpRequest(): Unit {
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1/a")
        spawn {serverPacketCapture()}
        let r = HttpRequestBuilder().url(u).build()
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        try {
            client.send(r)
        } catch (e: Exception) {
            println(e.message)
        }
        client.close()
    }
    func serverPacketCapture() {
        let serverSocket = TcpServerSocket(bindAt: 80)
        try {
            serverSocket.bind()
            let server = serverSocket.accept()
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("GET /a HTTP/1.1\r\nhost: 127.0.0.1:80\r\n"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
            @Expect(read.contains("content-length: 0\r\n"))
            @Expect(read.contains("connection: keep-alive\r\n"))
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
            serverSocket.close()
        } catch (e: Exception) {
            println(e.message)
            serverSocket.close()
        }
    }

    // https url without port or proxy
    @TestCase
    func client1_1HttpsRequest(): Unit {
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(cfg).build()
        let u = URL.parse("https://127.0.0.1/a")
        spawn {serverPacketCapture2()}
        let r = HttpRequestBuilder().url(u).build()
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        try {
            client.send(r)
        } catch (e: Exception) {
            println(e.message)
        }
        client.close()
    }
    func serverPacketCapture2() {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let serverSocket = TcpServerSocket(bindAt: 443)
        try {
            serverSocket.bind()
            let socket = serverSocket.accept()
            let server = TlsSocket.server(socket, serverConfig: cfg)
            server.handshake()
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("GET /a HTTP/1.1\r\nhost: 127.0.0.1:443\r\n"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
            @Expect(read.contains("content-length: 0\r\n"))
            @Expect(read.contains("connection: keep-alive\r\n"))
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
            serverSocket.close()
        } catch (e: Exception) {
            println(e.message)
        }
    }

    // http url with proxy
    let serverSocket3 = TcpServerSocket(bindAt: 0)
    @TestCase
    func client1_1HttpRequestProxy(): Unit {
        spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket3.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder()
            .httpProxy("http://127.0.0.1:${port}")
            .httpsProxy("http://130.1.1.1:${port}")
            .build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://1.0.0.1/a")
        let r = HttpRequestBuilder().url(u).build()
        client.send(r)
        client.close()
    }
    func serverPacketCapture3() {
        serverSocket3.bind()
        let port = (serverSocket3.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket3.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET http://1.0.0.1/a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        serverSocket3.close()
    }

    // http url with proxy
    @TestCase
    func client1_1HttpRequestProxy2(): Unit {
        let client = ClientBuilder().httpProxy("http://127.0.0.1").httpsProxy("http://130.1.1.1:66").build()
        let u = URL.parse("http://1.0.0.1/a")
        spawn {serverPacketCapture4()}
        let r = HttpRequestBuilder().url(u).build()
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        try {
            client.send(r)
        } catch (e: Exception) {
            println(e.message)
        }
        client.close()
    }
    func serverPacketCapture4() {
        let serverSocket = TcpServerSocket(bindAt: 80)
        try {
            serverSocket.bind()
            let server = serverSocket.accept()
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("GET http://1.0.0.1/a HTTP/1.1\r\nhost: 127.0.0.1:80\r\n"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
            @Expect(read.contains("content-length: 0\r\n"))
            @Expect(read.contains("connection: keep-alive\r\n"))
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
            serverSocket.close()
        } catch (e: Exception) {
            println(e.message)
            serverSocket.close()
        }
    }

    // https url with proxy
    let proxyServerSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func client1_1HttpsRequestProxy(): Unit {
        let server = serverPacketCapture6()
        spawn { proxyserverPacketCapture(server.port) }
        sleep(Duration.millisecond * 100)
        let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
        let port2 = server.port
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(cfg).httpsProxy("http://127.0.0.1:${port1}").build()
        let u = URL.parse("https://127.0.0.1:${port2}")
        let r = HttpRequestBuilder()
                        .url(u)
                        .build()
        client.logger.level = LogLevel.DEBUG
        client.send(r)
        client.close()
        server.close()
    }

    func proxyserverPacketCapture(serverPort: UInt16) {
        try{
            proxyServerSocket.bind()
            sleep(Duration.millisecond * 100)
            let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
            let socket = proxyServerSocket.accept()
            socket.readTimeout = Duration.millisecond * 100
        
            let buf = Array<UInt8>(500, repeat: 0)
            let i = socket.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("CONNECT 127.0.0.1:${serverPort} HTTP/1.1"))
            @Expect(read.contains("host: 127.0.0.1:${serverPort}"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1"))

            // Resolve the address and port of the target server
            let a:Array<String> = read.split(" ")
            let addrAndPort = a[1].split(":")
            let realServerAddr = addrAndPort[0]
            let realServerPort = addrAndPort[1]

            let remote_socket = TcpSocket(realServerAddr,UInt16.parse(realServerPort))
            remote_socket.connect()

            socket.write("HTTP/1.1 200 Connection Established\r\n\r\n".toArray())

            // Receive messages from the client and send them to the target server
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        remote_socket.write(buf1[0..i1])
                    }
                }
            }
            
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = remote_socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        socket.write(buf1[0..i1])
                    }
                }
            }
            sleep(Duration.second * 3)
            proxyServerSocket.close()
        } catch (e: Exception) {
            proxyServerSocket.close()
        }
    }

    func serverPacketCapture6():Server {
        var transportCfg = TransportConfig()
        transportCfg.readBufferSize = 8192
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let server = ServerBuilder()
                    .addr("127.0.0.1")
                    .port(0)
                    // .transportConfig(transportCfg)
                    .tlsConfig(cfg)
                    // .headerTableSize(10 * 1024)
                    // .maxRequestHeaderSize(1024 * 1024)
                    .build()
        server.distributor.register("", {httpContext =>
            httpContext.responseBuilder.body("Hello!")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond*100)
        return server
    }

    
    let realServerSocket1 = TcpServerSocket(bindAt: 0)
    let proxyServerSocket1 = TcpServerSocket(bindAt: 0)
    // https url with proxy
    @TestCase
    func client1_1HttpsRequestProxy2(): Unit {
        spawn { serverPacketCapture5() }
        spawn { proxyserverPacketCapture1() }
        sleep(Duration.millisecond * 100)
        let port1 = (proxyServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
        let port2 = (realServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(cfg).httpsProxy("http://127.0.0.1:${port1}").build()
        let u = URL.parse("https://127.0.0.1:${port2}")

        let r = HttpRequestBuilder()
                        .url(u)
                        .build()
        client.logger.level = LogLevel.DEBUG
        client.send(r)
        client.close()
        println("request_test_ok")
        asanGC()
    }

    func proxyserverPacketCapture1() {
        try{
            proxyServerSocket1.bind()
            sleep(Duration.millisecond * 100)
            let serverPort = (realServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
            let port1 = (proxyServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
            let socket = proxyServerSocket1.accept()
            socket.readTimeout = Duration.millisecond * 100
        
            let buf = Array<UInt8>(500, repeat: 0)
            let i = socket.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("CONNECT 127.0.0.1:${serverPort} HTTP/1.1"))
            @Expect(read.contains("host: 127.0.0.1:${serverPort}"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1"))

            // Resolve the address and port of the target server
            let a:Array<String> = read.split(" ")
            let addrAndPort = a[1].split(":")
            let realServerAddr = addrAndPort[0]
            let realServerPort = addrAndPort[1]

            let remote_socket = TcpSocket(realServerAddr,UInt16.parse(realServerPort))
            remote_socket.connect()

            socket.write("HTTP/1.1 200 Connection Established\r\n\r\n".toArray())

            // Receive messages from the client and send them to the target server
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        remote_socket.write(buf1[0..i1])
                    }
                }
            }
            
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = remote_socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        socket.write(buf1[0..i1])
                    }
                }
            }
            sleep(Duration.second * 3)
            proxyServerSocket1.close()
        } catch (e: Exception) {
            proxyServerSocket1.close()
        }
    }

    func serverPacketCapture5() {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        try {
            realServerSocket1.bind()
            sleep(Duration.millisecond * 100)
            
            let port1 = (proxyServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
            let port2 = (realServerSocket1.localAddress as IPSocketAddress)?.port ?? 0
            
            let socket = realServerSocket1.accept()
            let server = TlsSocket.server(socket, serverConfig: cfg)
            server.handshake()
            let buf = Array<UInt8>(2000, repeat: 0)
            let i1 = server.read(buf)
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            
            server.close()
            realServerSocket1.close()
        } catch (e: Exception) {
            realServerSocket1.close()
            println(e.message)
        }
    }
}

/* SCAN-IN
request_test_ok
*/