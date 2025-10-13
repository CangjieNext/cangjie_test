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
 *      test upgrade method dealing with body
 * Test API:
 *      public func upgrade(ctx: HttpContext): StreamingSocket
 */

import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import std.time.*
import std.io.*
import std.net.*
import std.collection.*
import std.fs.*
import stdx.crypto.x509.X509Certificate

var port = 0u16
var ser = Option<Server>.None

@Test
class Test_Upgrade_Body {
    var arrbody = Array<UInt8>(16 * 1024, repeat: 66)
    var arrbody_0 = Array<UInt8>(16 * 1024, repeat: 65)

    // 请求，响应均含有body：更改socket缓冲区设置，不影响存入的body
    @TestCase
    func upgradeTest(): Unit {
        spawn {
            startServer()
        }
        sleep(Duration.second)
        port = ser.getOrThrow().port

        let cfg = clientConfig()
        let client = ClientBuilder().tlsConfig(cfg).build()
        let request = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/ok")
            .header("Upgrade", "abc")
            .body(arrbody)
            .build()
        let (_, conn) = client.upgrade(request)
        conn?.readTimeout = Duration.second * 3
        let buf = Array<UInt8>(50, repeat: 0)
        let len = conn?.read(buf) ?? 0
        @Expect(len, 5)
        @Expect("hello".toArray(), buf[0..len])
        sleep(4 * Duration.second)

        client.close()
        ser.getOrThrow().close()
        conn?.close()
    }

    func serverConfig(): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
        tlsConfig.supportedAlpnProtocols = ["http/1.1"]
        tlsConfig
    }

    func clientConfig(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        tlsConfig.supportedAlpnProtocols = ["http/1.1"]
        tlsConfig
    }

    func startServer() {
        let cfg = serverConfig()
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        server.distributor.register("/ok", handler)
        ser = Option<Server>.Some(server)
        server.serve()
    }

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(101)
        ctx.responseBuilder.body(arrbody_0)
        let conn = upgrade(ctx)
        conn.readTimeout = Duration.second * 3

        conn.write("hello".toArray())
        let buf = Array<UInt8>(16 * 1024, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = conn.read(buf)
        while (readLen > 0) {
            try {
                allBody.add(all: buf[..readLen])
                readLen = conn.read(buf)
            } catch (e: Exception) {
                readLen = 0
            }
        }
        @Expect(allBody.toArray(), arrbody)
        println("read body success")
        conn.close()
    }
}
