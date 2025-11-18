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
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.io.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

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
class TestServerPush {
    var server = unsafe { zeroValue<Server>() }
    var client = unsafe { zeroValue<Client>() }

    @TestCase
    func push(): Unit {
        server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server
            .distributor
            .register(
                "/push",
                {
                    ctx =>
                    let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
                    pusher.push("/", "GET", HttpHeaders())
                    ctx.responseBuilder.body("push")
                }
            )
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("push ok")
        })

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        client = ClientBuilder().tlsConfig(clientConfig()).build()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/push").build()
        let response = client.send(request)
        let buf = Array<UInt8>(10, repeat: 0)
        var len = response.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "push")

        let pushResponses = response.getPush().getOrThrow()
        @Assert(pushResponses.size, 1)
        len = pushResponses[0].body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "push ok")
        client.close()
        server.close()
    }

    @TestCase
    func multi_push(): Unit {
        var flag = false
        server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server
            .distributor
            .register(
                "/push1",
                {
                    ctx =>
                    let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
                    pusher.push("/push2", "GET", HttpHeaders())
                    ctx.responseBuilder.body("push2")
                }
            )

        server
            .distributor
            .register(
                "/push2",
                {
                    ctx =>
                    let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
                    pusher.push("/push3", "GET", HttpHeaders())
                    ctx.responseBuilder.body("push3")
                }
            )

        server.distributor.register("/push3", {
            ctx => ctx.responseBuilder.body("push ok")
        })

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        client = ClientBuilder().tlsConfig(clientConfig()).build()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/push1").build()

        let response = client.send(request)
        client.close()
        server.close()
    }
}

// ASSERT: scan should not call server push on push stream
