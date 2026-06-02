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

type A = structA<ch>

type ch = Rune

var d: ch = r'a'

struct structA<T> {}

extend<T> structA<T> {
    public mut prop b: Rune {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

class B {
    public static var a: ch = A().b
}

main(): Int64 {
    if (B.a == r'a') {
        return 0
    } else {
        return 1
    }
}
