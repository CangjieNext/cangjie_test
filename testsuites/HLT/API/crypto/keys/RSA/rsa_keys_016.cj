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
    var rsaPri = RSAPrivateKey(1024)
    var rsaPub = RSAPublicKey(rsaPri)

    var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
    var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: "cangjie#123")
    var rsaPubfromPem = RSAPublicKey(rsaPrifromPem)

    var str: String = "helloworld"
    var sha512Instance = SHA512()
    var md: Array<Byte> = digest(sha512Instance, str)

    var sig = rsaPrifromPem.sign(sha512Instance, md, padType: PKCS1)
    if (rsaPub.verify(sha512Instance, md, sig, padType: PKCS1) && rsaPubfromPem.verify(sha512Instance, md, sig,
        padType: PKCS1)) {
        return 0
    } else {
        return 1
    }
}
