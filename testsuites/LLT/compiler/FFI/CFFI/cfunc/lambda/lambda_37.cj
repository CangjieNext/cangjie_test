// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %output 2>&1 | compare %f

interface I {
    static prop g: Unit {
        get() {
            println("g in I")
        }
    }
    static func f() {
        let fn: CFunc<()->Unit> = { =>
            g // equal to I.g
        }
        unsafe{fn()}
    }
}

main() {
    I.f()
}

/* SCAN
g in I
*/
