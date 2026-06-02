// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1 {
    func foo(): Int64
}

interface III2 {
    func foo(): Int64
}

class AAA <: III1 & III2 {
    public func foo(): Int64 {
        1
    }
}

main() {
    var x: III1 = AAA()
    x.foo() - 1
}
