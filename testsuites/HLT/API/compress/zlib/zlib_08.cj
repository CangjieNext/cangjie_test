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
    var flag = 0
    var dest1: ByteBuffer = ByteBuffer()
    try {
        var deis1 = DecompressInputStream(dest1, wrap: DeflateFormat, bufLen: 0)
    } catch (e: ZlibException) {
        flag += 1
    }
    try {
        var deis1 = DecompressInputStream(dest1, wrap: GzipFormat, bufLen: 0)
    } catch (e: ZlibException) {
        flag += 1
    }
    try {
        var deis2 = DecompressInputStream(dest1, wrap: DeflateFormat, bufLen: -1)
    } catch (e: ZlibException) {
        flag += 1
    }
    try {
        var deis2 = DecompressInputStream(dest1, wrap: GzipFormat, bufLen: -1)
    } catch (e: ZlibException) {
        flag += 1
    }
    try {
        var deis3 = DecompressInputStream(dest1, wrap: DeflateFormat, bufLen: -9223372036854775808)
    } catch (e: ZlibException) {
        flag += 1
    }
    try {
        var deis3 = DecompressInputStream(dest1, wrap: GzipFormat, bufLen: -9223372036854775808)
    } catch (e: ZlibException) {
        flag += 1
    }
    if (flag != 6) {
        return 1
    }
    0
}
