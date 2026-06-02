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

enum EE<T> {
    A00(T) | B00(T) | C00
}

enum EEE {
    B00(String)
}

main(): Int64 {
    const a1 = EE<Int64>.C00
    const a2 = A00(-1001)
    const a3 = EE<String>.B00("")
    const a4 = B00(0u8)

    match (a1) {
        case C00 => ()
        case _ => throw Exception("illegal type a1")
    }
    match (a2) {
        case A00(-1001) => ()
        case _ => throw Exception("illegal type a2")
    }
    match (a3) {
        case B00("abcbb  ") => throw Exception("error: wrong contents")
        case B00("") => ()
        case _ => throw Exception("illegal type a3")
    }
    match (a4) {
        case B00(1) => throw Exception("error: wrong contents")
        case B00(0) => ()
        case _ => throw Exception("illegal type a4")
    }
    return 0
}
