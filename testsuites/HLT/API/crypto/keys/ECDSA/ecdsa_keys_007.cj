/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*

main() {
    var ecPri = ECDSAPrivateKey(P256)
    var ecPub = ECDSAPublicKey(ecPri)

    var ecPriDer = ecPri.encodeToDer()
    var ecPrifromDer = ECDSAPrivateKey.decodeDer(ecPriDer)

    var ecPriPem = ecPri.encodeToPem()
    var ecPrifromPem = ECDSAPrivateKey.decodeFromPem(ecPriPem.encode())

    if (ecPri.toString() == "ECDSA PRIVATE KEY" && ecPrifromDer.toString() == "ECDSA PRIVATE KEY" &&
        ecPrifromPem.toString() == "ECDSA PRIVATE KEY") {
        return 0
    } else {
        return 1
    }
}
