// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-2: %run %run_opt %output

// struct member access: let + FuncDecl
struct A {
    func foo() {
        return 2
    }
}

main() {
    let a = A()
    var f = a.foo
    return f()
}
