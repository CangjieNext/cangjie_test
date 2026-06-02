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

main(): Int64 {
    var s1 = "abcb"
    var s2 = ""
    var r1 = s1.get(1)
    var r2 = s2.get(1)
    var r3 = "中国中".toRuneArray()[1]
    if (foo(r1) != UInt8(UInt32(r'b'))) {
        return 1
    }
    if (foo(r2) != UInt8(UInt32(r'1'))) {
        return 2
    }
    if (foo(r3) != r'国') {
        return 3
    }
    if (foo("中国abc".get(9)) != UInt8(UInt32(r'1'))) {
        return 4
    }
    return 0
}

func foo(x: Option<Rune>) {
    var a = match (x) {
        case Some(v) => v
        case None => r'1'
    }
    return a
}

func foo(x: Option<Byte>) {
    var a = match (x) {
        case Some(v) => v
        case None => UInt8(UInt32(r'1'))
    }
    return a
}
