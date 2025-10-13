// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main(): Int64 {
    let a1 = ClassA()
    let a2 = ClassA()
    let b1 = RecordB()
    let b2 = RecordB()
    let c1: InterfaceC = ClassD()
    let c2: InterfaceC = ClassD()
    return (a1 + a2) + (c1 + c2)
}
