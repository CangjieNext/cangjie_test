// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// EXEC-PIPE-0: %compiler %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// ASSERT: scan 123456789

interface I1<T> where T <: ToString {
    func foo(a: T): Unit {
        println(a)
    }
}

open class B <: I1<Int64> & I1<Bool> {
    
}

main() {
    B().foo(123456789)
}