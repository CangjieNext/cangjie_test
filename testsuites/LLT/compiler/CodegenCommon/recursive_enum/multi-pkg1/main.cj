// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt -p pkg %compile_lib_opt --output ./pkg.%middle
// EXEC: %compiler %cmp_opt pkg.%middle %n.cj
// EXEC: %run %main 2>&1 | compare %f
// ASSERT: scan 19\nNone\nNone\n

internal import pkg.*

struct Node3 {
    var a = Option<Node2>.Some(Node2())
}

func foo<T>(x: Option<T>) where T <: Node2 {
    match (x) {
        case Some(y) => println(y.k)
        case None => println("None")
    }
}

main() {
    var a = Node3()
    var b = Node2()
    foo(a.a)
    a.a = b.ab.a //(EnumTy) = (RefEnumTy)
    foo(b.ab.a)
    foo(a.a)
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
