/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan [thread#
// ASSERT: scan [conn#

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
import stdx.log.*
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
public class Test_log {
    @TestCase
    func log(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        s.distributor.register("/index", {
            httpContext => httpContext.responseBuilder.body("Hello 仓颉!")
        })
        s.logger.level = LogLevel.DEBUG
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }

        let c = ClientBuilder().tlsConfig(clientConfig()).build()

        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${s.port}/dd").build()

        spawn {
            c.send(req)
        }
        sleep(Duration.second * 6)
        s.close()
    }
}
