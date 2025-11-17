/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *		test client negotiate
 *
 * Test API:
 *		func doRequest(req: HttpRequest): HttpResponse
 */

package tests.client

import std.io.*
import stdx.net.http.*
import stdx.log.*
import std.sync.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.fs.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*


@Test
class TestClientRequestNegotiate {
    var client: Client = ClientBuilder().tlsConfig(negotiateClientConfig()).build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(negotiateServerConfig()).build()

    @TestCase
    func testGet(): Unit {
        startServer()
        let req = HttpRequestBuilder().version(HTTP2_0).get().url("https://127.0.0.1:${server.port}/req").build()
        let resp = client.send(req)
        @Assert(readBody(resp), "GET")
        client.close()
        server.close()
        asanGC()
    }

    func readBody(resp: HttpResponse): String {
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        return String.fromUtf8(buf[..len])
    }

    func startServer(): Unit {
        server.distributor.register("/req", {
            ctx => ctx.responseBuilder.body(ctx.request.method)
        })

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}

func negotiateServerConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

func negotiateClientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
    tlsConfig
}
