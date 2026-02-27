/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Expection.
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
var server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig("h2")).port(0).build()

@Test
class Test_Abort_02 {
    func startserve():Unit {
        var a: HttpRequestHandler = FuncHandler( { httpContext =>
            let bodyBuf = Array<UInt8>(20000, repeat: 0)
            let allBody = ArrayList<UInt8>()
            var readLen = httpContext.request.body.read(bodyBuf)
            while(readLen == 0) {
                allBody.add(all: bodyBuf[..readLen])
                readLen = httpContext.request.body.read(bodyBuf)
            }
            @Expect(allBody.toArray().size, 160000)
            }
        )

        var b: HttpRequestHandler = FuncHandler( { httpContext =>
            let arr_16 = Array<UInt8>(16 * 1000, repeat: 13)
            httpContext.responseBuilder.body(arr_16)
            httpContext.responseBuilder.header("transfer-encoding", "chunked")
            httpContext.responseBuilder.header("Trailer", "12345")
            httpContext.responseBuilder.header("Trailer", "abcde")
            httpContext.responseBuilder.trailer("12345", "ssdlh")
            httpContext.responseBuilder.trailer("abcdz", "wxyz")
            }
        )

        var c: HttpRequestHandler = FuncHandler( { httpContext =>
            let str = String(Array<Rune>(16000, repeat: r'b'))
            httpContext.responseBuilder.body(str)
            httpContext.responseBuilder.header("transfer-encoding", "chunked")
            httpContext.responseBuilder.header("Trailer", "12345")
            httpContext.responseBuilder.header("Trailer", "abcde")
            httpContext.responseBuilder.trailer("12345", "ssdlh")
            httpContext.responseBuilder.trailer("abcdz", "wxyz")
            }
        )

        var d: HttpRequestHandler = FuncHandler( { httpContext =>
            let ins = ByteBuffer(100000)
            ins.write(Array<Byte>(16000, repeat: UInt8(2)))
            httpContext.responseBuilder.body(ins)
            httpContext.responseBuilder.header("transfer-encoding", "chunked")
            httpContext.responseBuilder.header("Trailer", "12345")
            httpContext.responseBuilder.header("Trailer", "abcde")
            httpContext.responseBuilder.trailer("12345", "ssdlh")
            httpContext.responseBuilder.trailer("abcdz", "wxyz")
            }
        )

        server.distributor.register("test/a", a)
        server.distributor.register("test/b", b)
        server.distributor.register("test/c", c)
        server.distributor.register("test/d", c)
        server.serve()
    }

    @TestCase
    func test_01(): Unit {
        spawn {
            startserve()
        }

        while(server.port == 0) {sleep(Duration.millisecond)}
        port = server.port

        func startClient(client: Client, request: HttpRequest) {
            var arr_20 = Array<UInt8>(200000, repeat: 3)
            let res1 = client.send(request)
            @Expect(res1.status, 200)

            spawn {
                res1.close()
            }
            sleep(Duration.second)
            var readlen_1 = 0
            while(readlen_1 < 16000) {
                 try{
                    readlen_1 += res1.body.read(arr_20)
                }catch(_){

                }
            }
            @Expect(readlen_1, 16000)
           
        }
        let client = ClientBuilder().tlsConfig(clientConfig("h2")).build()

        for( _ in 0..10 ) {
            spawn {
                let req = HttpRequestBuilder()
                    .url("https://127.0.0.1:${port}/test/b")
                    .version(HTTP2_0)
                    .build()
                startClient(client, req)    
            }
        }

        for( _ in 0..10 ) {
            spawn {
                let req = HttpRequestBuilder()
                    .url("https://127.0.0.1:${port}/test/c")
                    .version(HTTP2_0)
                    .build()
                startClient(client, req)    
            }
        }

        for( _ in 0..10 ) {
            spawn {
                let req = HttpRequestBuilder()
                    .url("https://127.0.0.1:${port}/test/d")
                    .version(HTTP2_0)
                    .build()
                startClient(client, req)    
            }
        }

        sleep(Duration.second * 4)
        server.close()

    }
}

