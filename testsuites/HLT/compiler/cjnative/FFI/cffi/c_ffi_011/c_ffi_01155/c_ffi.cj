/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    var n: Int64

    init(i: Int64) {
        this.n = i
    }
}

main() {
    let f1: CFunc<() -> Unit> = {
        =>
        var a = A(0)
        a.n + 1
    }

    unsafe { f1() }
}
