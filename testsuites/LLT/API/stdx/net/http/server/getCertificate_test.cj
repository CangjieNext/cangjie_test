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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *       After the handshake between the server and client succeeds, the client send the certificate.
 *       The server invokes clientCertificate to obtain the peer certificate.
 * Test API:
 *       HttpContext.clientCertificate
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import stdx.encoding.url.*
import std.io.*
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
        let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
        cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        cfg.clientIdentityRequired = Required
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
        if (let Some(cer) <- ctx.clientCertificate) {
            let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
            let clientCer = X509Certificate.decodeFromPem(pem)
            @Expect(cer[..1].map({c => (c as X509Certificate).getOrThrow()}) == clientCer)
        } else {
            @Expect(1, 2)
        }
    }

    func sendRequest1() {
        var clientCfg = clientConfig()
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        clientCfg.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), GeneralPrivateKey.decodeFromPem(keyPem))
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let resp = client.send(req)
        println(resp)
        let contentLength = resp.headers.getFirst("content-length")
        var arr = Array<UInt8>()
        if (let Some(s) <- contentLength) {
            arr = Array<UInt8>(Int64.parse(s), repeat: 0)
            resp.body.read(arr)
        }
        @Expect(String.fromUtf8(arr), message)

        client.close()
    }
}
