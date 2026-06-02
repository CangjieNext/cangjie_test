/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %output %f
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args
// ASSERT: scan Server Illegal Argument ALPN
// ASSERT: scan Client Illegal Argument ALPN

import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.fs.*

main(): Int64 {
    var clientConfig = TlsClientConfig()
    try {
        clientConfig.supportedAlpnProtocols = ["\0"]
    } catch (e: IllegalArgumentException) {
        println("Client Illegal Argument ALPN")
    }

    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConfig = TlsServerConfig(serverCert, pkey)
    serverConfig.verifyMode = TrustAll
    try {
        serverConfig.supportedAlpnProtocols = ["\0"]
    } catch (e: IllegalArgumentException) {
        println("Server Illegal Argument ALPN")
    }

    return 0
}
