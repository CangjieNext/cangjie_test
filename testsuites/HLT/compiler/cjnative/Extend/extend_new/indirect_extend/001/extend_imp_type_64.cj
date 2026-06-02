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

type A<T, k> = structA<T, k>

var d = r'#'

extend<T, K> structA<T, K> <: I<T, K> where T <: Rune, K <: String {
    public mut static prop i: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

interface I<T, K> {
    mut static prop i: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

struct structA<T, K> where T <: Rune, K <: String {
    public var a: T
    public var b: K
    public structA(x: T, y: K) {
        this.a = x
        this.b = y
    }
}

main(): Int64 {
    func a(a: A<Rune, String>) {
        return a.a.toString() + a.b
    }

    A<Rune, String>.i = r'@'

    if (a(A<Rune, String>(A<Rune, String>.i, "345")) == "@345") {
        return 0
    } else {
        return 1
    }
}
