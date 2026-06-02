// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-3: %run %run_opt %output %run_args

func h() {
    func f() {
        var (x, y) = (1, 2)
        func g() {
            x + y
        } // captured a mutable variable

        g()
    }
    return f // ok
}

main() {
    h()()
}
