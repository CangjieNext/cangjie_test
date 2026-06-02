// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix 
// RUN-EXEC: %run %run_opt %output %run_args

interface III1 {
    func foo1(): Int64 {
        0
    }
}

interface III2 {
    func foo2(): Int64 {
        1
    }
}

interface III3 {
    func foo3(): Int64 {
        2
    }
}

class AAA <: III1 & III2 & III3 {
    public func foo2(): Int64 {
        3
    }
    public func foo1(): Int64 {
        4
    }
    public func foo3(): Int64 {
        5
    }
}

main() {
    return AAA().foo1() - 4 + AAA().foo2() - 3 + AAA().foo3() - 5
}
