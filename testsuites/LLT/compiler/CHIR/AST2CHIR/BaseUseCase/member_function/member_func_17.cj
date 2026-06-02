// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-2: %run %run_opt %output

// class invoke+abstract
abstract class A {
    public func f(): Int64
}

class B <: A {
    public func f(): Int64 {
        return 2
    }
}

func test(a: A) {
    return a.f() // abstract func is not in the symbol table.
}

main() {
    let a = B()
    test(a)
}
