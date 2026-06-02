// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1 {
    func foo1(): Int64
}

open class AAA <: III1 {
    public func foo1(): Int64 {
        1
    }
}

interface III2 {
    func foo1(): Int64 {
        2
    }
}

class BBB <: AAA & III2 {}

main() {
    return BBB().foo1() - 1
}
