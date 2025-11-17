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
 * Test description: server don't set alpnlist， when it receive h2 request ,
 *                   it should be treated as h1 request
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.time.*
import std.sync.*
import std.collection.*
import std.io.*
import std.fs.*
import asan.*

var port = UInt16(0)
var ser = Option<Server>.None

@Test
class Test_Chunked_01 {
    public func serverConfig(): TlsServerConfig {
        let pem0 = String.fromUtf8(readToEnd(File("files/end_rsa.cer", Read)))
        let pem02 = String.fromUtf8(readToEnd(File("files/end_rsa_private_key.pem", Read)))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
        // tlsConfig.supportedAlpnProtocols = ["h2"]
        tlsConfig
    }

    public func clientConfig(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("files/root_rsa.cer", Read)))
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
        // tlsConfig.alpnProtocolsList = ["h2"]
        // tlsConfig.alpnProtocolsList = ["http/1.1", "h2"]
        tlsConfig
    }

    func startserve(): Unit {
        let cfg = serverConfig()
        var server = ServerBuilder().addr("127.0.0.1").tlsConfig(cfg).port(0).build()
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                let bodyBuf = Array<UInt8>(20000, repeat: 0)
                let allBody = ArrayList<UInt8>()
                var readLen = httpContext.request.body.read(bodyBuf)
                while (readLen > 0) {
                    allBody.add(all: bodyBuf[..readLen])
                    readLen = httpContext.request.body.read(bodyBuf)
                }
                @Expect(allBody.toArray().size, 16000)
            }
        )
        server.distributor.register("/test/a", a)
        sleep(Duration.millisecond * 100)
        ser = Option<Server>.Some(server)
        server.serve()
    }

    // h2 client发给未配置的server request
    @TestCase
    func test_01(): Unit {
        spawn {
            startserve()
        }

        sleep(Duration.second)
        port = ser.getOrThrow().port
        var ins = ByteBuffer()
        ins.write(Array<Byte>(16000, repeat: 2))
        var req1 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .version(HTTP2_0)
            .body(ins)
            .build()
        let cfg = clientConfig()
        var client = ClientBuilder().tlsConfig(cfg).build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        client.close()
        ser.getOrThrow().close()
        asanGC()
    }
}
