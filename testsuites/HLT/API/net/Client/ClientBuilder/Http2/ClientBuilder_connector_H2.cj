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
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.math.*
import std.convert.Parsable
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
var flag = false

@Test
class Test_ClientConnector {
    var server = unsafe { zeroValue<Server>() }

    @TestCase
    func connector(): Unit {
        startServer()
        var client = ClientBuilder().connector(TcpConnector).tlsConfig(clientConfig()).build()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/").build()

        let resp = client.send(request)
        let buf_true = Array<UInt8>(20, repeat: 0)
        resp.body.read(buf_true)
        @Expect(flag, true)
        @Expect(resp.status, 200)
        @Expect(String.fromUtf8(buf_true).contains("TcpConnector"), true)
        client.close()
        server.close()
    }

    let TcpConnector = {
        sa: SocketAddress =>
        let socket = TcpSocket(sa)
        socket.connect()
        flag = true
        return socket
    }

    func startServer() {
        server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("TcpConnector")
        })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
    }
}
