/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A<T> = enumA<T>

enum enumA<T> {
    B((T, T))
}

interface I {
    static func b() {
        r'8'
    }
}

extend<T> A<T> <: I {}

var a: A<Rune> = B((r'&', A<Rune>.b()))
var b: String = match (a) {
    case B(x) => match (x) {
        case (first, r'8') => "8前面 是 ${first}"
        case _ => ""
    }
    case _ => ""
}

main(): Int64 {
    if (b == "8前面 是 &") {
        return 0
    } else {
        return 1
    }
}
