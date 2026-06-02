// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    static func f1() {
        return 1
    }
}

struct Foo2 {
    static func f1() {
        return 1
    }
}

enum Foo3 {
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)

    static func f1() {
        return 1
    }
}

extend Foo {
    static func f2() {
        return 1
    }
}

main() {
    Foo.f1()
    Foo.f2()
    Foo2.f1()
    Foo3.f1()
    return 0
}
