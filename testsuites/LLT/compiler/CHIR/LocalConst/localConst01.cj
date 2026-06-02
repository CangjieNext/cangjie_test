// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    mut prop prop_a: Bool {
        get() {
            true
        }
        set(Value) {
        }
    }
}

func foo(bbbb!: (x: Int64) -> Int64, aaaa!: Int64 = bbbb(1), ddd!: Int64 = 2) {
    return A()
}

main() {
    foo(
        bbbb: {
            a: Int64 =>
            const ccc = 1111;
            return ccc
        },
        aaaa: 2,
        ddd: 2
    ).prop_a ||= true
    return 0
}
