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

type A<T> = structA<T>

type TI = I

var d = r'a'

interface I {
    mut static prop b: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

extend<T> structA<T> <: TI where T <: Rune {
    public mut static prop b: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

struct structA<T> where T <: Rune {
    public var a: T
    public structA(var x: T) {
        this.a = x
    }
}

let r = A<Rune>(A<Rune>.b)
let r1 = Option<A<Rune>>.Some(r)
let r1a: Option<Rune> = r1?.a

main(): Int64 {
    let a: Rune = match (r1a) {
        case Some(x) => x
        case _ => r'*'
    }
    if (a == r'a') {
        return 0
    } else {
        return 1
    }
}
