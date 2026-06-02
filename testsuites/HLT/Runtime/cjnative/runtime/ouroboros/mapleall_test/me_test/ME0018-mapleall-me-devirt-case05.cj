/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Inter2.foo()

interface Inter1 {
    func foo(): Unit {
        print("Inter1.foo()\n")
    }
}

interface Inter2 <: Inter1 {
    func foo(): Unit {
        print("Inter2.foo()\n")
    }
}

class ClassA <: Inter2 {}

main(): Int64 {
    var inf1: Inter1 = ClassA()
    inf1.foo()
    return 0
}
