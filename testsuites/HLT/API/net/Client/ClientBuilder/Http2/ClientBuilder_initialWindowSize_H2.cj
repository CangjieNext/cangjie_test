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
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

@Test
public class Test_initialWindowSize {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.initialWindowSize, 65535)
    }

    @TestCase
    func min(): Unit {
        let client = ClientBuilder().initialWindowSize(1).build()
        @Expect(client.initialWindowSize, 1)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().initialWindowSize(2147483647).build()
        @Expect(client.initialWindowSize, 2147483647)
    }

    @TestCase
    func zero(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().initialWindowSize(0).build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("InitialWindowSize should between 1 and 2147483647."))
        }
        @Expect(flag, true)
    }

    @TestCase
    func over_value(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().initialWindowSize(2147483648).build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("InitialWindowSize should between 1 and 2147483647."))
        }
        @Expect(flag, true)
    }

    @TestCase
    func five(): Unit {
        let bodyStr = "helloworld"
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server.logger.level = LogLevel.TRACE
        server
            .distributor
            .register(
                "serverInitialWindowSize",
                {
                    ctx =>
                    let buf = Array<UInt8>(10, repeat: 0)
                    let _ = ctx.request.body.read(buf)
                }
            )
        server.distributor.register("clientInitialWindowSize", {ctx => ctx.responseBuilder.body(bodyStr)})

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().tlsConfig(clientConfig()).initialWindowSize(5).build()
        client.logger.level = LogLevel.DEBUG

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/clientInitialWindowSize")
            .build()

        let response = client.send(request)

        let buf = Array<UInt8>(10, repeat: 0)
        while (response.body.read(buf) != 0) {}

        client.close()
        server.close()
    }
}

//ASSERT:scan-2 write frame: Data Frame [Length: 5
