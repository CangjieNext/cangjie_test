// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 2

func f() {
    let y = 2
    func h() {
        print(y) // OK, captured an immutable variable.
    }
    let d = h // OK, h can be assigned to variable
    return h // OK, h can be a return value
}

main() {
    f()()
}
