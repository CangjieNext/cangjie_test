// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC-0: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

extend Int64 {
    operator func ()(x: Int64): Int64 {
        return this - x
    }
}

struct A {
    public mut prop a_prop: Int64 {
        get() {
            102
        }
        set(Value) {
            ()
        }
    }
}

var a = A()

struct B {
    mut static prop b_prop: Int64 {
        get() {
            2
        }
        set(Value) {
            ();
        }
    }
    init() {
        (a.a_prop)(b_prop)
    }
}

main(): Int64 {
    return 0
}
