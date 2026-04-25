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
import std.io.*
import std.crypto.digest.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    var str: String = "cangjie-helloworld"
    var SHA1Instance = SHA1()
    var md5Instance = MD5()
    var md: Array<Byte> = digest(md5Instance, str)

    var sig = rsaPri.sign(md5Instance, md, padType: PKCS1)
    if (!rsaPub.verify(SHA1Instance, md, sig, padType: PKCS1)) {
        return 0
    } else {
        return 1
    }
}
