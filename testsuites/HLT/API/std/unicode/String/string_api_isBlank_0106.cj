/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unicode.*

func expectThrow(s: String): Bool {
    try {
        let _ = s.isBlank()
        return false
    } catch (_: IllegalArgumentException) {
        return true
    }
}

func expectShortCircuit(s: String): Bool {
    try {
        return s.isBlank() == false
    } catch (_: IllegalArgumentException) {
        return false
    }
}

main() {
    // String 契约要求合法 UTF-8，以下经 fromUtf8Unchecked 构造契约外非法输入
    let throwCases: Array<String>
    let shortCircuitCases: Array<String>
    unsafe {
        throwCases = [
            String.fromUtf8Unchecked([0x80u8]),                         // 首字节即非法续字节
            String.fromUtf8Unchecked([0x20u8, 0x80u8]),                 // ASCII 空白后非法字节
            String.fromUtf8Unchecked([0xE3u8, 0x80u8, 0x80u8, 0x80u8]), // U+3000 空白后非法字节
            String.fromUtf8Unchecked([0x20u8, 0xE8u8, 0x80u8])          // ASCII 空白后截断三字节序列
        ]
        shortCircuitCases = [
            String.fromUtf8Unchecked([0x61u8, 0x80u8]),                 // "a" 后非法字节，短路返回 false 不抛
            String.fromUtf8Unchecked([0xEFu8, 0xBCu8, 0x81u8, 0x80u8])  // "！" 后非法字节，短路返回 false 不抛
        ]
    }

    for (i in 0..throwCases.size : 1) {
        if (!expectThrow(throwCases[i])) {
            return i + 1
        }
    }
    for (i in 0..shortCircuitCases.size : 1) {
        if (!expectShortCircuit(shortCircuitCases[i])) {
            return 10 + i + 1
        }
    }
    return 0
}
