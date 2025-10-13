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
import std.collection.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.process.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]
    tlsConfig
}

var client: Client = unsafe { zeroValue<Client>() }
var server: Server = unsafe { zeroValue<Server>() }
var proxy: Server = unsafe { zeroValue<Server>() }

func startServer(): Unit {
    server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    server
        .distributor
        .register(
            "/proxys",
            {
                ctx =>
                let buf = Array<UInt8>(15, repeat: 0)
                let len = ctx.request.body.read(buf)
                @Assert(String.fromUtf8(buf[..len]), "hello proxys")
                ctx.responseBuilder.body("proxys ok")
            }
        )
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
}

func startProxy(): Unit {
    proxy = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    proxy.logger.level = LogLevel.DEBUG
    proxy
        .distributor
        .register(
            "/proxys",
            {
                ctx =>
                let buf = Array<UInt8>(1024, repeat: 0)
                var len = ctx.request.body.read(buf)
                let req = HttpRequestBuilder()
                    .url(ctx.request.url)
                    .method(ctx.request.method)
                    .setHeaders(ctx.request.headers)
                    .body(buf[..len])
                    .build()
                let c = ClientBuilder().build()
                let resp = c.send(req)
                len = resp.body.read(buf)
                ctx.responseBuilder.status(resp.status).setHeaders(resp.headers).body(buf[..len])
                c.close()
            }
        )
    spawn {
        proxy.serve()
    }
    while (proxy.port == 0) {
        sleep(Duration.millisecond)
    }
}

@Test
public class Test_httpsProxy {
    @TestCase
    func notset_httpsProxy_with_setenv(): Unit {
        Process.current.setEnv("https_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().build()
        @Expect(client.httpsProxy, "http://192.168.1.1:80")
        Process.current.removeEnv("https_proxy")
    }

    @TestCase
    func set_httpsProxy_with_setenv(): Unit {
        Process.current.setEnv("https_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().httpsProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpsProxy, "http://127.1.1.1:8080")
        Process.current.removeEnv("https_proxy")
    }

    @TestCase
    func set_httpsProxy_without_setenv(): Unit {
        let client = ClientBuilder().httpsProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpsProxy, "http://127.1.1.1:8080")
    }

    @TestCase
    func notset_httpsProxy_without_setenv(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.httpsProxy, "")
    }

    @TestCase
    func abnormal_02(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().httpsProxy("http://%2").tlsConfig(clientConfig()).build()
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
            let client = ClientBuilder().httpsProxy("http://abc").tlsConfig(clientConfig()).build()
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
        client = ClientBuilder().httpsProxy("http://127.0.0.1:${server.port}").tlsConfig(clientConfig()).build()
        let req = HttpRequestBuilder()
            .url("https://127.0.0.1:${proxy.port}/proxys")
            .version(HTTP1_1)
            .body("hello proxys")
            .build()
        let resp = client.send(req)
        let buf = Array<UInt8>(15, repeat: 0)
        var len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "proxys ok")
        client.close()
        server.close()
        proxy.close()
    }
}

main() {
    startServer()
    startProxy()
    let report = Test_httpsProxy().asTestSuite().runTests()
    report.reportTo(ConsoleReporter())
    return report.failedCount + report.errorCount
}
