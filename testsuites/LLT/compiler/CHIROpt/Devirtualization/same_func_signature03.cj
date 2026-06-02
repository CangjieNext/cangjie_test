// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// EXEC-PIPE-0: %compiler %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// ASSERT: scan bbbb

interface I1 {
    func foo<T>(a: T): Unit
}

interface I2 {
    func foo<T>(a: T): Unit
}

open class B <: I1 & I2 {
    public func foo<Y>(x: Y): Unit {
        println("bbbb");
    }
}

main() {
    B().foo<Int64>(1)
}