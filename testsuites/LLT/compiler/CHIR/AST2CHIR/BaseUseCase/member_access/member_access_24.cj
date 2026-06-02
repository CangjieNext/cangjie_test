// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-3: %run %run_opt %output

// struct member access: var + this func
struct A {
    func foo(b: Int64) {
        return 2 + b
    }

    func bar() {
        var a = this.foo
        return a(1)
    }

    mut func moo() {
        var a = this.foo
        return a(1)
    }
}

main() {
    var a = A()
    return a.bar()
}
