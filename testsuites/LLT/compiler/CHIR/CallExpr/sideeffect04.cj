// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f   
// EXEC-PIPE-0: %run %run_opt %output %run_args 
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public class A {
    public mut prop foo: Int64 {
        get() {
            1
        }
        set(value) {
        }
    }
}

main() {
    var a = A()
    a.foo <<= (try {
        a.foo <<= 1
        2
    } finally {
        2
    }
    )
    0
}