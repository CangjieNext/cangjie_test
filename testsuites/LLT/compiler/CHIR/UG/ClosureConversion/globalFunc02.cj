// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-3: %run %run_opt %n.%suffix

func foo1<T>(x: T) {
    x
}

func foo2<T>(x: T) {
    x
}

func goo1<U>(a: U) {
    var x = foo1<U>
    x(a)
    x = foo2<U>
    x(a)
}

func goo2<U>(a: U) {
    var x = foo2<U>
    x(a)
    x = foo1<U>
    x(a)
}

main() {
    goo1<Int64>(1) + goo2<Int64>(2)
}
