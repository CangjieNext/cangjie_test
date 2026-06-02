// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableO2 %f -o %output
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main(): Int64 {
    if (case01(1, 2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32): A {
    if (a > b) {
        return A()
    } else {
        return B()
    }
}

open class A {
    public let a = 2
    public open func aoo() {
        return a
    }
}

class B <: A {
    public let b = 1
    public override func aoo() {
        return b
    }
}
