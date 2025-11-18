/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %export cjHeapSize=4GB && %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.encoding.url.*
import stdx.net.http.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.alpnProtocolsList = ["h2"]
    tlsConfig
}

@Test
public class Test_writeTimeout {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.writeTimeout, Duration.second * 15)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().writeTimeout(Duration.Max).tlsConfig(clientConfig()).build()
        @Expect(client.writeTimeout, Duration.Max)
    }

    @TestCase
    func zero(): Unit {
        let body = "s" * 1024 * 1024 * 150
        var flag = false
        let s = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.request.body.read(Array<UInt8>(5, repeat: 0))
                    ctx.responseBuilder.body("ok")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().writeTimeout(Duration.Zero).tlsConfig(clientConfig()).build()
        @Expect(client.writeTimeout, Duration.Zero)
        let request = HttpRequestBuilder().body(body).url("https://127.0.0.1:${s.port}/dd").version(HTTP2_0).build()
        let e = @AssertThrows[HttpTimeoutException | SocketException | HttpException](client.send(request))
        @Expect(e.message.contains("client2_0 write request timeout") || e.message.contains("Connection refused") || e.message.contains("Stream closed"))
        client.close()
        s.close()
    }

    @TestCase
    @Skip // writeTimeout 结果受 CI 环境影响
    func negative(): Unit {
        let body = "s" * 1024 * 1024 * 150
        var flag = false
        let s = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.request.body.read(Array<UInt8>(5, repeat: 0))
                    ctx.responseBuilder.body("ok")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        sleep(Duration.second)
        let client = ClientBuilder().writeTimeout(Duration.nanosecond * -1).tlsConfig(clientConfig()).build()
        @Expect(client.writeTimeout, Duration.Zero)
        let request = HttpRequestBuilder().body(body).url("https://127.0.0.1:${s.port}/dd").version(HTTP2_0).build()
        let e = @AssertThrows[HttpTimeoutException | SocketException](client.send(request))
        @Expect(e.message.contains("client2_0 write request timeout") || e.message.contains("Connection refused"))
        client.close()
        s.close()
    }
}
