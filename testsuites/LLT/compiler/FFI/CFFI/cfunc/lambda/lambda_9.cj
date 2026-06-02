// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f 2>&1

class A {
    var n: Int64

    init(i: Int64) {
        this.n = i
    }
}

main() {
    let f1: CFunc<() -> Int64> = { =>
        var a = A(0)
        a.n
    }

    unsafe { f1() }
}
