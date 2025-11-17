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
 *       After the handshake between the server and client succeeds, the client does not send the certificate.
 *       Invoking clientCertChain returns None.
 * Test API:
 *       HttpContext.clientCertificate
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.encoding.url.*
import std.{net.*, fs.*}
import std.unittest.*
import std.unittest.testmacro.*
import std.convert.Parsable
import {asan.*, tlsconfig.*}

@Test
class TestServer11TlsAllRightTest {
    var port = 0u16
    let message = "hello world"

    @TestCase
    func lessTest(): Unit {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/hello", handler)
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
        sleep(Duration.second)
        port = server.port
        sendRequest1()
        server.close()
        asanGC()
    }

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("content-length", "11").body(message)
        if (let Some(_) <- ctx.clientCertificate) {
            @Expect(1, 2)
        }
        println("ok")
    }

    func sendRequest1() {
        var clientCfg = clientConfig()
        clientCfg.alpnProtocolsList = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        client.send(req)

        client.close()
    }
}

/* SCAN-IN
ok
 */
