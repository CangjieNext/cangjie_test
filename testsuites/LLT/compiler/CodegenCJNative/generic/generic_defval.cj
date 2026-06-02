// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo<Int64>(1, "x", 3)
    if (res == "3xyz") {
        return 0
    }
    return 1
}

func Foo<T>(a: Int64, b: String, t: T, A!: Int64 = 2, B!: String = "yz"): String {
    return (a + A).toString() + b + B
}
