/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o %output  %f
// RUN-EXEC: %run_stdx %output %run_args  

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.crypto.digest.*
import std.fs.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    var rsaPubDer = rsaPub.encodeToDer()
    var rsaPubfromDer = RSAPublicKey.decodeDer(rsaPubDer)

    var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
    var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: Option.Some("cangjie#123"))
    var rsaPubfromPem = RSAPublicKey(rsaPrifromPem)

    if (rsaPub.toString() == "RSA PUBLIC KEY" && rsaPubfromDer.toString() == "RSA PUBLIC KEY" &&
        rsaPubfromPem.toString() == "RSA PUBLIC KEY") {
        return 0
    } else {
        return 1
    }
}
