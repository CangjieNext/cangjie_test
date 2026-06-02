/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type A<T> = enumA<T>

enum enumA<T> where T <: Rune {
    B((T, T))
}

var a: A<Rune> = B((r'&', r'8'))
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

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
