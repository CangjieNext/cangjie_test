// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {

}

struct B <: I {
    func goo() {
        return 1
    }
}

func foo<T>(a: T) where T <: I {
    var b = a
}

struct A<T> {
    var b = 1
    func goo() {
        var x = 2
    }
}

main() {
    foo<B>(B())
    var x = A<Int32>().b
    var y = A<Rune>().b
    return x - y
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
