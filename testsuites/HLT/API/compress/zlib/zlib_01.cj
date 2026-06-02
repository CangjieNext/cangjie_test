/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.compress.zlib.*
import std.io.*

main() {
    var n: Int64 = 0
    var aa: CompressInputStream
    var dest1: ByteBuffer = ByteBuffer()
    try {
        aa = CompressInputStream(dest1, bufLen: 0)
    } catch (e: ZlibException) {
        n++
    }
    try {
        aa = CompressInputStream(dest1, bufLen: -1)
    } catch (e: ZlibException) {
        n++
    }
    try {
        aa = CompressInputStream(dest1, bufLen: -9223372036854775808)
    } catch (e: ZlibException) {
        n++
    }
    if (n != 3) {
        return 1
    }
    return 0
}
