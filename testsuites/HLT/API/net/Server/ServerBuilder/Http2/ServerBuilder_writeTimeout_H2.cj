/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.math.*
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

func send_request(s: Server) {
    let client = ClientBuilder().tlsConfig(clientConfig()).build()

    let request = HttpRequestBuilder().url("https://127.0.0.1:${s.port}").version(HTTP2_0).build()

    let response = client.send(request)
    return response
}

@Test
public class Test_writeTimeout_h2 {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        @Expect(server.writeTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .writeTimeout(Duration.Max)
            .build()
        @Expect(server.writeTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .writeTimeout(Duration.Zero)
            .build()
        @Expect(server.writeTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let response = send_request(server)
        } catch (e: HttpException | HttpTimeoutException) {
            @Expect(e.message.contains("Stream closed") || e.message.contains("client2_0 receive response for stream 1 timeout"), true)
        }
        server.close()
    }

    @TestCase
    func negative(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .writeTimeout(Duration.nanosecond * -1)
            .tlsConfig(serverConfig())
            .build()
        @Expect(server.writeTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let response = send_request(server)
        } catch (e: HttpException | HttpTimeoutException) {
            @Expect(e.message.contains("Stream closed") || e.message.contains("client2_0 receive response for stream 1 timeout"), true)
        }
        server.close()
    }
}
