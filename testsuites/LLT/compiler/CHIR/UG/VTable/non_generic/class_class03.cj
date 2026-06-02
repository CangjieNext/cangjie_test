// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

open class AAA {
    public open func foo1(): Int64 {
        1
    }
}

open class BBB <: AAA {
    public func foo1(): Int64 {
        2
    }
    public open func foo2(): Int64 {
        3
    }
}

class CCC <: BBB {
    public func foo2(): Int64 {
        4
    }
}

main() {
    return CCC().foo1() + CCC().foo2() - 6
}
