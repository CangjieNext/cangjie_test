// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %coverage_opt %n.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan operator func () in enum
// ASSERT: scan 1.000000

enum E {
    X | X(Float64)

    operator func ()(a: Float64) {
        print("operator func () in enum\n")
        a
    }
}

main() {
    let e: E = X(1.0)
    let res = e(1.0)
    print("${res}\n")
    0
}
