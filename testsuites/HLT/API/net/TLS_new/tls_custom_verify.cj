/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %output %f
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import std.fs.*
import std.io.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.net.http.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_CustomVerify {
    @TestCase
    func test_ClientCustomVerify_Success(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            true  // 自定义证书验证成功
        })
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func test_ClientCustomVerify_Fail(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            false // 自定义证书验证失败
        })
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        @ExpectThrows[TlsException](client.get(url))
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }


    @TestCase
    func test_ServerVerifyDisabled_With_ClientSuccess(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Disabled //客户端默认不校验
        serverTlsConfig.verifyMode = CustomVerify({_ => false})
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => true}) //无证书, 自定义成功
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func test_ServerVerifyDisabled_With_ClientFail(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Disabled //客户端默认不校验
        serverTlsConfig.verifyMode = CustomVerify({_ => false})
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => false}) //无证书, 自定义失败
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()
        //@ExpectThrows[TlsException](client.handshake())

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)


        let url = "https://127.0.0.1:${server.port}/"
       
        try {
            client.get(url)
        } catch (e: Exception) {
            @Expect(e.message.contains("TLS handshake failed"))
            sum += 1
        }
        @Expect(sum, 1)

        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func test_ServerVerifyOptional_With_ClientSuccess(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Optional //客户端可选
        serverTlsConfig.verifyMode = CustomVerify({_ => false})
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        // let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        // let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        // clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
        //     GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => true}) //无证书, 自定义成功
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func test_ServerVerifyRequireed_With_ClientSuccess(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Required
        serverTlsConfig.verifyMode = CustomVerify({_ => true})
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("Hello")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./data/end_ecdsa.pem", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => true})
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

}
