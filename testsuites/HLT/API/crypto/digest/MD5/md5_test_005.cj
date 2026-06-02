/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args  

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var str: String = "Weclome#MD5$to_Cangjie"
    var md5Instance = MD5()
    var md5Length: Int64 = md5Instance.size
    var md5BlockSize: Int64 = md5Instance.blockSize
    println("md5Lengh: " + md5Length.toString())
    println("md5BlockSize: " + md5BlockSize.toString())
    if (md5Length != 16 || md5BlockSize != 64) {
        return 1
    }
    return 0
}
