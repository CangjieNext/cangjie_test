/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.process.*

var client: Client = unsafe { zeroValue<Client>() }
var server: Server = unsafe { zeroValue<Server>() }
var proxy: Server = unsafe { zeroValue<Server>() }

func startServer(): Unit {
    server = ServerBuilder().addr("127.0.0.1").port(0).build()
    server
        .distributor
        .register(
            "/proxy",
            {
                ctx =>
                let buf = Array<UInt8>(15, repeat: 0)
                let len = ctx.request.body.read(buf)
                @Assert(String.fromUtf8(buf[..len]), "hello proxy")
                ctx.responseBuilder.body("proxy ok")
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
    proxy = ServerBuilder().addr("127.0.0.1").port(0).build()
    proxy.logger.level = LogLevel.DEBUG
    proxy
        .distributor
        .register(
            "/proxy",
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
public class Test_httpProxy {
    @TestCase
    func notset_httpProxy_with_setenv(): Unit {
        Process.current.setEnv("http_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().build()
        @Expect(client.httpProxy, "http://192.168.1.1:80")
        Process.current.removeEnv("http_proxy")
    }

    @TestCase
    func set_httpProxy_with_setenv(): Unit {
        Process.current.setEnv("http_proxy", "http://192.168.1.1:80")
        let client = ClientBuilder().httpProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpProxy, "http://127.1.1.1:8080")
        Process.current.removeEnv("http_proxy")
    }

    @TestCase
    func set_httpProxy_without_setenv(): Unit {
        let client = ClientBuilder().httpProxy("http://127.1.1.1:8080").build()
        @Expect(client.httpProxy, "http://127.1.1.1:8080")
    }

    @TestCase
    func notset_httpProxy_without_setenv(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.httpProxy, "")
    }

    @TestCase
    func abnormal_02(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().httpProxy("http://%2").build()
            client.get("http://127.0.0.1:8080")
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
            let client = ClientBuilder().httpProxy("http://abc").build()
            client.get("http://127.0.0.1:8080")
        } catch (e: Exception) {
            flag = true
            @Expect(e.message.contains("Failed to resolve address abc"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func abnormal_04(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().httpProxy("abc").build()
            client.get("127.0.0.1:8080")
        } catch (e: Exception) {
            flag = true
            @Expect(e.message.contains("Proxy must have http scheme"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func testProxy(): Unit {
        client = ClientBuilder().httpProxy("http://127.0.0.1:${server.port}").build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${proxy.port}/proxy").body("hello proxy").build()
        let resp = client.send(req)
        let buf = Array<UInt8>(15, repeat: 0)
        var len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "proxy ok")
        client.close()
        server.close()
        proxy.close()
    }
}

main() {
    startServer()
    startProxy()
    let report = Test_httpProxy().asTestSuite().runTests()
    report.reportTo(ConsoleReporter())
    return report.failedCount + report.errorCount
}
