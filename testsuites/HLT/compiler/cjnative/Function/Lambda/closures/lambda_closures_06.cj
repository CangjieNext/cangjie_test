/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    foo1()
    foo2()
    foo3()
    return 0
}

func foo1(a!: Int32 = 1) {
    var x1 = {=> a}
    var x2 = {=> a}()
    var x3 = foo({=> a})
    if (a == 2) {
        return {=> a}
    } else {
        return foo({=> a})
    }
}

func foo2(a!: Int32 = 1, y1!: () -> Int32 = {=> a}, y2!: () -> Int32 = foo({=> a})) {
    var x1 = {=> a}
    var x2 = {=> a}()
    var x3 = foo({=> a})
    if (a == 2) {
        return {=> a}
    } else {
        return foo({=> a})
    }
}

func foo3(a!: Int32 = 1, y1!: () -> Int32 = {=> a}, y2!: () -> Int32 = foo({=> a})) {
    {=> a}
}

func foo(x: () -> Int32) {
    return x
}

func goo(x: Int32) {
    return x
}
