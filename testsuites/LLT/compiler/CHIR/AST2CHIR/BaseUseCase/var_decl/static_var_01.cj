// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC: %run %run_opt %output

func foo() {
    return 1
}

struct A {
    var a = 2
}

struct B {
    static var a = 1
    static var b = A()
    static let c = foo()
}

main() {
    return B.a + B.c - B.b.a
}
