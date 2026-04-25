/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o %output  %f
// RUN-EXEC: %run_stdx %output %run_args  

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.crypto.digest.*
import std.fs.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    var rsaPriDer = rsaPri.encodeToDer(password: Option.Some("cangjie#123"))
    var rsaPrifromDer = RSAPrivateKey.decodeDer(rsaPriDer, password: Option.Some("cangjie#123"))

    var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
    var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: Option.Some("cangjie#123"))

    if (rsaPri.toString() == "RSA PRIVATE KEY" && rsaPrifromDer.toString() == "RSA PRIVATE KEY" &&
        rsaPrifromPem.toString() == "RSA PRIVATE KEY") {
        return 0
    } else {
        return 1
    }
}
