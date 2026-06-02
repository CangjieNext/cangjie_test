// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Test for generic instantiation ptr re-arrange for extend constraints in upper bound.
func test<T>(a: T): Unit where T <: ToString {
    println(a.toString())
    //    let x = a.hashCode() /*Removed hash code implementation for arrays*/
    return
}

main() {
    let arr = [[1, 2], [3, 4]]
    test(arr)
    0
}
