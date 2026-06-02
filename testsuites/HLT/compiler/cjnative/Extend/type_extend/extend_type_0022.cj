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
interface A {
    mut prop a: Int64 {
        get() {
            return 1
        }
        set(p) {
            a = p
        }
    }
}

class B {}

class C {}

class D {}

extend B <: A {}

extend C <: A {}

extend D <: A {}

main() {
    var a = 1
    var res: A = if (a == 1) {
        B()
    } else if (true) {
        C()
    } else {
        D()
    }
    return 1 - res.a
}
