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
 *       Test the function of dynamically updating(updateCA) the root certificate on the server.
 * Test API:
 *       Server.serve()
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.encoding.url.URL
import std.io.*
import std.{net.*, fs.*}
import std.unittest.*
import std.unittest.testmacro.*
import std.convert.Parsable
import {asan.*, tlsconfig.*}

@Test
class TestServer11updateCA {
    var port = 0u16
    let message = "hello world"

    @TestCase
    func rightTest(): Unit {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
        cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server
            .distributor
            .register("/hello", {
                httpContext => httpContext.responseBuilder.header("content-length", "11").body(message)
            })
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
        sleep(Duration.second)
        port = server.port
        sendRequest1()
        sleep(Duration.millisecond * 100)
        sendRequest2()

        server.updateCert("./files/end_ecdsa.cer", "./files/end_ecdsa_private_key.pem")
        server.updateCA("./files/root_ecdsa.cer")
        sendRequest3()
        sendRequest4()
        server.close()
        asanGC()
    }

    func sendRequest1() {
        var clientCfg = clientConfig()
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let resp = client.send(req)
        let contentLength = resp.headers.getFirst("content-length")
        var arr = Array<UInt8>()
        if (let Some(s) <- contentLength) {
            arr = Array<UInt8>(Int64.parse(s), repeat: 0)
            resp.body.read(arr)
        }
        @Expect(String.fromUtf8(arr), message)

        client.close()
    }

    func sendRequest2() {
        var clientCfg = clientConfig()
        let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        try {
            client.send(req)
        } catch (e: TlsException) {
            println("test ok 1")
        }
        client.close()
    }

    func sendRequest3() {
        var clientCfg = clientConfig()
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        try {
            client.send(req)
        } catch (e: TlsException) {
            println("test ok 2")
        }
        client.close()
    }

    func sendRequest4() {
        var clientCfg = clientConfig()
        let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let resp = client.send(req)
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
/* SCAN-IN
test ok 1
 */
/* SCAN-IN
test ok 2
 */
