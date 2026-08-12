// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan doo in B

public open class A {
    static public func doo(obj: A) {
        println("doo in A")
    }
}

public open class B <: A {
    static public func coo() {
        let b = B()
        B.doo(b)
    }
    static public func doo(obj: B) {
        println("doo in B")
    }
}

main() {
    B.coo()
}