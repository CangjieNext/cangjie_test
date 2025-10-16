/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.collection.*
import stdx.encoding.url.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.fs.*
import std.io.*
import std.process.*
import std.convert.*

var client: Client = unsafe { zeroValue<Client>() }
var server: Server = unsafe { zeroValue<Server>() }

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}
func startServer(): Unit {
    server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    server.distributor.register("/proxy",
        {
            ctx =>
            let buf = Array<UInt8>(15, repeat: 0)
            let len = ctx.request.body.read(buf)
            @Assert(String.fromUtf8(buf[..len]), "hello proxys")
            ctx.responseBuilder.body("proxys ok")
        })
    spawn {
        server.serve()
    }
    while(server.port == 0) {sleep(Duration.millisecond)}
}
let proxyServerSocket = TcpServerSocket(bindAt: 0)
func startProxy(serverPort : UInt16): Unit {
     try{
        proxyServerSocket.bind()
        sleep(Duration.millisecond * 200)
        let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
        let socket = proxyServerSocket.accept()
        socket.readTimeout = Duration.millisecond * 100
    
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
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

@Test
public class Test_httpsProxy {
    @TestCase
    func notset_httpsProxy_with_setenv(): Unit {
        Process.current.setEnv("https_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.httpsProxy, "http://192.168.1.1:80")
        Process.current.removeEnv("https_proxy")
    }

    @TestCase
    func set_httpsProxy_with_setenv(): Unit {
        Process.current.setEnv("https_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().tlsConfig(clientConfig()).httpsProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpsProxy, "http://127.1.1.1:8080")
        Process.current.removeEnv("https_proxy")
    }

    @TestCase
    func set_httpsProxy_without_setenv(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).httpsProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpsProxy, "http://127.1.1.1:8080")
    }

    @TestCase
    func notset_httpsProxy_without_setenv(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.httpsProxy, "")
    }

    @TestCase
    func abnormal_02(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().tlsConfig(clientConfig()).httpsProxy("http://%2").build()
            let request = HttpRequestBuilder().url("https://127.0.0.1:8080").version(HTTP1_1).build()
            let res = client.send(request)
        } catch (e: Exception) {
            flag = true
            @Expect(e.toString().contains("UrlSyntaxException"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func abnormal_03(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().tlsConfig(clientConfig()).httpsProxy("http://abc").build()
            let request = HttpRequestBuilder().url("https://127.0.0.1:8080").version(HTTP1_1).build()
            let res = client.send(request)
        } catch (e: Exception) {
            flag = true
            @Expect(e.message, "Failed to resolve address abc.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func testProxy(): Unit {
        let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
        client = ClientBuilder().httpsProxy("http://127.0.0.1:${port1}").tlsConfig(clientConfig()).build()
        let req =
            HttpRequestBuilder().url("https://127.0.0.1:${server.port}/proxy").version(HTTP2_0).body("hello proxys").
        build()
        let resp = client.send(req)
        let buf = Array<UInt8>(15, repeat: 0)
        var len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf).contains("proxys ok"))
        client.close()
        server.close()
    }
}

main() {
    startServer()
    spawn { startProxy(server.port) }
    let report = Test_httpsProxy().asTestSuite().runTests()
    report.reportTo(ConsoleReporter())
    return report.failedCount + report.errorCount
}