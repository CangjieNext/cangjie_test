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

import stdx.net.http.*
import stdx.crypto.keys.*
////import stdx.crypto.kit.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import stdx.encoding.url.*
import std.io.*
import std.fs.*
import std.convert.Parsable

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0).map({c => c}), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["http/1.1"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.alpnProtocolsList = ["http/1.1"]
    tlsConfig
}

@Test
class Test_updateCA {
    var port = 0u16
    let message = "hello world"

    @TestCase
    func errorcase(): Unit {
        var flag = false
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server
            .distributor
            .register("/hello", {
                httpContext => httpContext.responseBuilder.header("content-length", "11").body(message)
            })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            server.updateCA("files/root_ecdsa.cer")
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message.contains("The TLS certificate is not configured"))
        }
        @Expect(flag, true)
        server.close()
    }

    @TestCase
    func lessTest(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server
            .distributor
            .register("/hello", {
                httpContext => httpContext.responseBuilder.header("content-length", "11").body(message)
            })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        sendRequest1()
        sendRequest2()
        server.updateCert("./files/end_ecdsa.cer", "./files/end_ecdsa_private_key.pem")
        server.updateCA("files/root_ecdsa.cer")
        sendRequest3()
        sendRequest4()
        server.close()
    }

    func sendRequest1() {
        var clientCfg = TlsClientConfig()
        let pem0 = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem0).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]

        let pem = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
        clientCfg.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), PrivateKey.decodeFromPem(keyPem))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let resp = client.send(req)
        let contentLength = resp.headers.getFirst("content-length")
        var arr = Array<UInt8>()
        if (let Some(s) <- contentLength) {
            arr = Array<UInt8>(Int64.parse(s), repeat: 0)
            resp.body.read(arr)
        }
        @Expect(String.fromUtf8(arr), message)

        client.close()
    }

    func sendRequest2() {
        var clientCfg = TlsClientConfig()
        let pem0 = String.fromUtf8(readToEnd(File("files/root_ecdsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem0).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        clientCfg.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), PrivateKey.decodeFromPem(keyPem))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        try {
            client.send(req)
        } catch (e: TlsException) {
            println("test ok 1")
        }
    }

    func sendRequest3() {
        var clientCfg = TlsClientConfig()
        let pem0 = String.fromUtf8(readToEnd(File("files/root_rsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem0).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]

        let pem = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
        clientCfg.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), PrivateKey.decodeFromPem(keyPem))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        try {
            client.send(req)
        } catch (e: TlsException) {
            println("test ok 2")
        }
    }

    func sendRequest4() {
        var clientCfg = TlsClientConfig()
        let pem0 = String.fromUtf8(readToEnd(File("files/root_ecdsa.cer", Read)))
        clientCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem0).map({c => c}))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]

        let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        clientCfg.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), PrivateKey.decodeFromPem(keyPem))
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(clientCfg).build()
        let u = URL.parse("https://127.0.0.1:${port}/hello")
        let req = HttpRequestBuilder().url(u).header("Connection", "close").build()
        let resp = client.send(req)
        let contentLength = resp.headers.getFirst("content-length")
        var arr = Array<UInt8>()
        if (let Some(s) <- contentLength) {
            arr = Array<UInt8>(Int64.parse(s), repeat: 0)
            resp.body.read(arr)
        }
        @Expect(String.fromUtf8(arr), message)

        client.close()
    }
}

/* SCAN-IN
   test ok 1
 */

/* SCAN-IN
   test ok 2
 */
