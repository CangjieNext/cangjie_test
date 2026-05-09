/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o %output  %f
// RUN-EXEC: %run_stdx %output %run_args  

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.crypto.digest.*
import std.fs.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    var rsaPubPem = rsaPub.encodeToPem()
    var rsaPubfromPem = RSAPublicKey.decodeFromPem(rsaPubPem.encode())

    var rsaPriDer = rsaPri.encodeToDer(password: Option.Some("cangjie#123"))
    var rsaPrifromDer = RSAPrivateKey.decodeDer(rsaPriDer, password: Option.Some("cangjie#123"))
    var rsaPubfromDer = RSAPublicKey(rsaPrifromDer)

    var str: String = "helloworld"
    var sha512Instance = SHA512()
    var md: Array<Byte> = digest(sha512Instance, str)

    var sig = rsaPri.sign(sha512Instance, md, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2))))
    if (rsaPubfromPem.verify(sha512Instance, md, sig, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2)))) &&
        rsaPubfromDer.verify(sha512Instance, md, sig, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2))))) {
        return 0
    } else {
        return 1
    }
}
