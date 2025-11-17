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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan GET /hello HTTP/2.0

/*
 * Test description: Test debug info for client.send().
 */

import stdx.net.http.*
import std.time.*
import std.convert.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.log.*
import std.sync.*

@Test
class TestSendRequestDebugInfo {
    let certPath = "files"

    func serverConfig(): TlsServerConfig {
        let cert = String.fromUtf8(File.readFrom("${certPath}/end_rsa.cer"))
        let key = String.fromUtf8(File.readFrom("${certPath}/end_rsa_private_key.pem"))
        var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(cert), PrivateKey.decodeFromPem(key))
        tlsConfig.supportedAlpnProtocols = ["h2"]
        tlsConfig
    }

    func clientConfig(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = TrustAll
        tlsConfig.alpnProtocolsList = ["h2"]
        tlsConfig
    }

    func startServer(): UInt16 {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server.distributor.register("/hello", {_ =>})

        spawn {server.serve()}

        sleep(Duration.millisecond * 100)
        return server.port
    }

    func clientGet(port: UInt16): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.DEBUG

        client.get("https://localhost:${port}/hello")
        client.close()
    }

    @TestCase
    func testSendRequestDebugInfo() {
        let port = startServer()
        clientGet(port)
    }
}
