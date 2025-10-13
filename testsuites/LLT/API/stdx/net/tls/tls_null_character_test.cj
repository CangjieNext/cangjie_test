/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args

/*
 * Test description:
 *      test null character
 */

import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.GeneralPrivateKey
import std.fs.*
import std.io.*
import std.collection.HashMap

main(): Int64 {
    var cfgC = TlsClientConfig()
    try {
        cfgC.serverName = "oss.PMS.com\0123"
        return -5
    } catch (e: IllegalArgumentException) {
    }
    try {
        cfgC.supportedAlpnProtocols = ["http/1.1", "h2\01"]
        return -8
    } catch (e: IllegalArgumentException) {
    }

    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
    var cfgS = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    cfgS.supportedVersions = [V1_2, V1_3]
    try {
        cfgC.supportedAlpnProtocols = ["http/1.1", "h2\01"]
        return -16
    } catch (e: IllegalArgumentException) {
    }
    return 0
}
