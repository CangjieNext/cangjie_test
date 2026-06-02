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
    const a1 = EE<String>.B00("123")
    const a2 = EEE.B00("123")

    match (a1) {
        case B00("123") => ()
        case _ => throw Exception("illegal type a1")
    }
    match (a2) {
        case B00("123") => ()
        case _ => throw Exception("illegal type a2")
    }

    return 0
}
