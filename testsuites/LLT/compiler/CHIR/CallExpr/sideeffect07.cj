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

public open class A {
    public mut prop A_p1: Int32 {
        get() {
            Int32(1)
        }
        set(Value) {
        }
    }
}

func bar(a: (Int32) -> Unit): A {
    return A();
}

main() {
    bar(
        {
            b: Int32 =>
            var a: A = A();
            a.A_p1
        }
    ).A_p1 += 2
    0
}

