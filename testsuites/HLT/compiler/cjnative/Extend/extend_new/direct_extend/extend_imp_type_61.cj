/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

type A<T> = interfaceA<T>

var d = r'#'

interface interfaceA<T> where T <: Rune {
    func a(a: T) {
        a
    }
}

class C {}

extend C <: A<Rune> {
    public mut prop b: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

class B <: A<Rune> {}

main(): Int64 {
    if (B().a(r'#') == C().b) {
        return 0
    } else {
        return 1
    }
}
