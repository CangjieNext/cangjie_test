/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// DEPENDENCE: ../../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test if HttpRequest can copied and modified correctly
 * Test API:
 *      public init(request: HttpRequest)
 */

import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import std.time.*
import std.sync.*
import std.fs.*
import stdx.crypto.x509.*
import std.io.*

@Test
class Test_Copy_Request_Headers {
    var port = 0u16
    var ser = Option<Server>.None

    func serverConfig(protocol: String): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = [protocol]
        tlsConfig
    }

    func clientConfig(protocol: String): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.supportedAlpnProtocols = [protocol]
        tlsConfig
    }

    func startServer1() {
        var cfg = serverConfig("http/1.1")
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        server.distributor.register("/content", handler1)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        ser = Option<Server>.Some(server)
        port = ser.getOrThrow().port
    }

    func startServer2() {
        var cfg = serverConfig("h2")
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        server.distributor.register("/content", handler1)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        ser = Option<Server>.Some(server)
        port = ser.getOrThrow().port
    }

    func handler1(ctx: HttpContext): Unit {
        let req = ctx.request
        var newRequest = HttpRequestBuilder(req).build()
        @Expect(req.bodySize, newRequest.bodySize)
        let buf = Array<Byte>(6, repeat: 0)
        var i = req.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello,")
        i = newRequest.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "server")
        i = req.body.read(buf) // read to end
        @Expect(i, 0)
        // copy again to copy trailers
        newRequest = HttpRequestBuilder(req).build()
        req.headers.add("h", "h")
        req.headers.add("request", "r2")
        req.trailers.add("t", "t2")
        let req1 = req.toString()
        let req2 = newRequest.toString()
        println("req1:")
        println(req1)
        println("req2:")
        println(req2)
        @Expect(req1.contains("request: r1,r2\r\n"))
        @Expect(req1.contains("trailer: t\r\n"))
        @Expect(req1.contains("request: r1,r2\r\n"))
        @Expect(req1.contains("h: h\r\n"))
        @Expect(req2.contains("request: r1\r\ntrailer: t\r\n"))
        @Expect(req2.contains("t: t1\r\n"))
        @Expect(req.remoteAddr, newRequest.remoteAddr)
        @Expect(req.method, newRequest.method)
        @Expect(req.url.toString(), newRequest.url.toString())
        @Expect(req.version, newRequest.version)
        @Expect(req.bodySize, newRequest.bodySize)
        @Expect(req.form.toEncodeString(), newRequest.form.toEncodeString())
        @Expect(req.isPersistent, newRequest.isPersistent)
        @Expect(req.readTimeout, newRequest.readTimeout)
        @Expect(req.writeTimeout, newRequest.writeTimeout)
    }

    // test for h1s
    @TestCase
    func request_copy_01(): Unit {
        startServer1()
        var cfg = clientConfig("http/1.1")
        let client = ClientBuilder().tlsConfig(cfg).build()
        let request = HttpRequestBuilder()
            .get()
            .header("request", "r1")
            .header("trailer", "t")
            .header("transfer-encoding", "chunked")
            .url("https://127.0.0.1:${port}/content")
            .trailer("t", "t1")
            .body("hello,server")
            .build()
        client.send(request)
        client.close()
        ser.getOrThrow().close()
    }

    // test for h2
    @TestCase
    func request_copy_02(): Unit {
        startServer2()
        var cfg = clientConfig("h2")
        let client = ClientBuilder().tlsConfig(cfg).build()
        let request = HttpRequestBuilder()
            .get()
            .header("request", "r1")
            .header("trailer", "t")
            .header("transfer-encoding", "chunked")
            .url("https://127.0.0.1:${port}/content")
            .trailer("t", "t1")
            .body("hello,server")
            .build()
        client.send(request)
        client.close()
        ser.getOrThrow().close()
    }
}
