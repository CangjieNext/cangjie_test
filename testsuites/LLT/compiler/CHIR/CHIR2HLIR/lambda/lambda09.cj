// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test0() {
    let lambdaExpression = {a: Int64 => {b: Int64 => b}}
    return lambdaExpression(3)(4)
}

func test1() {
    let lambdaExpression = {a: Int64 => {b: Int64 => b}}
    return lambdaExpression(3)
}

main(): Int64 {
    test0() - test1()(4)
}
