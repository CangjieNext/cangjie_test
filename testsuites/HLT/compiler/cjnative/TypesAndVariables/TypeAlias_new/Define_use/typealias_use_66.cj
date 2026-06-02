/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type A<T, k> = enumA<T, k>

enum enumA<T, K> where T <: Rune, K <: String {
    B(T) | C(K)
}

main(): Int64 {
    func a(a: Int64): A<Rune, String> {
        if (a > 10) {
            return A<Rune, String>.B(r'%')
        } else {
            return return A<Rune, String>.C("%%")
        }
    }

    func b(b: Int64) {
        var c: String = match (a(b)) {
            case B(x) => x.toString()
            case C(y) => y
            case _ => "fail"
        }
        return c
    }

    if (b(10) == "%%") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
