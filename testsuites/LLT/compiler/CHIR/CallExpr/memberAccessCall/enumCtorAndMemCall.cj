// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Foo {
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)

    func f1() {
        return 1
    }
}

main() {
    let a = Foo.Month(1.0, 2.0)
    a.f1()
    return 0
}
