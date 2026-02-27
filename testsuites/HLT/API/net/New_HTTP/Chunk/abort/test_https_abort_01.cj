/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.net.http.*
import stdx.net.tls.*
import std.io.*
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.collection.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate

public func serverConfig(protocol: String): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = [protocol]
    tlsConfig
}

public func clientConfig(protocol: String): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = [protocol]
    tlsConfig
}

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig("http/1.1")).port(0).build()

@Test
class Test_Abort_01 {
    func startserve():Unit {
        var a: HttpRequestHandler = FuncHandler( { httpContext =>
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.body(Array<UInt8>(20000, repeat: UInt8(10)))
                sleep(Duration.second)
            }
        )

        var b: HttpRequestHandler = FuncHandler( { httpContext =>
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                httpContext.responseBuilder.body(Array<UInt8>(20000, repeat: b'b'))
            }
        )

        var c: HttpRequestHandler = FuncHandler( { httpContext =>
                httpContext.responseBuilder.header("transfer-encoding", "chunked")
                var ins = ByteBuffer(20000)
                ins.write(Array<Byte>(10000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
                sleep(Duration.second * 5)
                ins.write(Array<Byte>(10000, repeat: UInt8(3)))
            }
        )
        server.distributor.register("test/close1", a)
        server.distributor.register("test/close2", b)
        server.distributor.register("test/close3", c)
        server.serve()
    }

    @TestCase
    func test_close_01(): Unit {
        spawn {
            startserve()
        }

        while(server.port == 0) {sleep(Duration.millisecond)}
        port = server.port
        var req1 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test/close1")
            .version(HTTP1_1)
            .build()
        var client = ClientBuilder().tlsConfig(clientConfig("http/1.1")).build()
        let response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))

        spawn {
            response1.close()
        }
        sleep(Duration.second)
        var buf1 = Array<UInt8>(20000, repeat: 0)
        try{
            response1.body.read(buf1)

        }catch(_){}

        client.close()
    }

    @TestCase
    func test_close_02(): Unit {
        port = server.port
        var req2 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test/close2")
            .version(HTTP1_1)
            .build()
        var client = ClientBuilder().tlsConfig(clientConfig("http/1.1")).build()
        let response2 = client.send(req2)
        @Expect(response2.status, UInt16(200))

        spawn {
            response2.close()
            response2.close()
        }
        var buf2 = Array<UInt8>(20000, repeat: 0)
        try{
            response2.body.read(buf2)

        }catch(_){}

        response2.close()
        response2.close()
        client.close()
        response2.close()
    }

    @TestCase
    func test_close_03(): Unit {
        port = server.port
        var req3 = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/test/close3")
            .version(HTTP1_1)
            .build()
        var client = ClientBuilder().tlsConfig(clientConfig("http/1.1")).build()
        let response3 = client.send(req3)
        @Expect(response3.status, UInt16(200))
        response3.close()
        var buf3 = Array<UInt8>(20000, repeat: 0)
        try{
            response3.body.read(buf3)

        }catch(_){

        }finally {
            @Expect(buf3[0..2000], Array<UInt8>(2000, repeat: 0))
        }

        client.close()
        server.close()
    }

}

