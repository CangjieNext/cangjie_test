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

let emptyArr1: Array<A> = [B(), C(), D()]

main() {
    var res0: A = emptyArr1[0]
    var res1: A = emptyArr1[1]
    var res2: A = emptyArr1[2]
    return res0.a + res1.a + res2.a - 3
}
