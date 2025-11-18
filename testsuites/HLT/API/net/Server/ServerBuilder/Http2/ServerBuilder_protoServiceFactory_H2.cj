/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f

import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.time.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.net.*
import std.math.*
import std.convert.Parsable
import std.fs.*
import std.io.*

var flag = 0

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
class TestCustomizeProtocolServiceFactory {
    @TestCase
    func testCustomize(): Unit {
        let server = startServerByIProtocolService()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        server.logger.level = LogLevel.TRACE
        client.logger.level = LogLevel.TRACE
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}").build()
        spawn {
            flag = 1
            let rsp = client.send(request)
        }
        while (flag == 0) {
            sleep(Duration.millisecond)
        }
        sleep(Duration.second)
        server.close()
    }
}

func startServerByIProtocolService() {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .tlsConfig(serverConfig())
        .protocolServiceFactory(IProtocolServiceFactory())
        .build()

    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}

class IProtocolServiceFactory <: ProtocolServiceFactory {
    public func create(p: Protocol, s: StreamingSocket): ProtocolService {
        println(p)
        return IProtocolService()
    }
}

class IProtocolService <: ProtocolService {
    protected func serve() {}
}

// ASSERT: scan HTTP/2.0
