// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %n.%suffix

interface I1 {
    static func foo1(): Int32
    static func foo2() {
        foo1()
    }
}

interface I2 <: I1 {}

main() {}
