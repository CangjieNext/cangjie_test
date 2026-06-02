// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var count = 0

func run<T>() {
    let a: Array<UInt8> = [1, 2]
    func test<T>() {
        count++
        a
    }
    test<T>()[0] = 3
}

main() {
    let a: Array<UInt8> = [1, 2]
    func test() {
        count++
        a
    }
    test()[0] += 3
    println(count)
    return 0
}
