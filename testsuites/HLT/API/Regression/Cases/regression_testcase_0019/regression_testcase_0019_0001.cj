/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./cert
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f

import std.io.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.net.*
import std.sync.*
import std.fs.*

var sendNum = 128
var spawnNum = 10000
let successNum = AtomicInt64(0)
var ser = Option<Server>.None
var port: UInt16 = 0

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./cert/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./cert/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0).map({c => c}), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./cert/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

func serve() {
    var serverTlsCfg = serverConfig()
    serverTlsCfg.supportedVersions = [TlsVersion.V1_2]
    serverTlsCfg.supportedCipherSuites[TlsVersion.V1_2] = ["ECDHE-RSA-AES128-SHA256", "ECDHE-RSA-AES256-SHA384", "ECDHE-RSA-AES256-GCM-SHA384",
        "ECDHE-RSA-AES256-GCM-SHA384"]

    let socket = TcpServerSocket(bindAt: port)
    let server = ServerBuilder().listener(socket).tlsConfig(serverTlsCfg).build()
    server.distributor.register("/", {ctx => ctx.responseBuilder.body("Server getting request.t")})
    ser = server
    server.serve()
}

func clientOnce(): Int64 {
    var clientTlsCfg = clientConfig()
    let client = ClientBuilder().tlsConfig(clientTlsCfg).build()

    for (_ in 0..sendNum) {
        try {
            client.get("https://127.0.0.1:${port}/")
        } catch (e: TlsException) {
            if (e.message == "Failed to get the tls socket stream.") {
                continue
            }
            throw e
        } catch (e: SocketTimeoutException) {
            continue
        } catch (e: SocketException) {
            if (e.message.contains("Cannot assign requested address.")) {
                continue
            }
        }
    }
    client.close()
    return 1
}

main(): Int64 {
    spawn {
        serve()
    }
    while (ser.getOrThrow().port == 0) {
        sleep(Duration.millisecond)
    }

    for (_ in 0..spawnNum) {
        spawn {
            successNum.fetchAdd(clientOnce())
        }
    }
    while (successNum.load() != spawnNum) {
        sleep(Duration.second)
    }
    ser.getOrThrow().close()
    return 0
}
