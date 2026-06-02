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
import std.io.*
import std.crypto.digest.*

main() {
    var rsaPri = RSAPrivateKey(1024)
    var rsaPub = RSAPublicKey(rsaPri)

    var str: String = "hello world, hello cangjie"
    var bas1 = ByteBuffer()
    var bas2 = ByteBuffer()
    var bas3 = ByteBuffer()
    bas1.write(str.toArray())

    var encOpt = OAEPOption(SHA384(), SHA512(), label: "cangjieworld")
    rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
    var encOpt2 = OAEPOption(SHA384(), SHA512(), label: "cangjieworld")
    rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))

    var buf = Array<Byte>(str.size, repeat: 0)
    bas3.read(buf)
    if (str.toArray() == buf) {
        return 0
    } else {
        return 1
    }
}
