/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o %output %f

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.crypto.digest.*
import std.fs.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    var rsaPubDer = rsaPub.encodeToDer(password: "cangjie#123")
    var rsaPubfromDer = RSAPublicKey.decodeDer(rsaPubDer, password: "cangjie#123")

    var str: String = "helloworld"
    var sha512Instance = SHA512()
    var md: Array<Byte> = digest(sha512Instance, str)

    var sig = rsaPri.sign(sha512Instance, md, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2))))
    if (rsaPub.verify(sha512Instance, md, sig, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2)))) &&
        rsaPubfromDer.verify(sha512Instance, md, sig, padType: PSS(PSSOption(Int32(2048 / 8 - md.size - 2))))) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_wrong_number_of_arguments
