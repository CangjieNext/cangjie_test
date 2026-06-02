// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define2.cj
// EXEC: %compiler %cmp_macro define2.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output %macro_debug
// EXEC: %run %run_opt %output %run_args
// EXEC: %cat call-use-ast.cj.macrocall

import test.*

@M
class A {
    var x = 42
    init() {
        this.x = x
    }
    func getX(): String {
        func foo() {
            print("Do nothing\n")
        }
        let a = "foo"
        print("test noting")
        return "x" + "y\nz" + "\n" + "gfh\n"
    }

    func sum(a: Int32, b: Int32): Int32 {
        let a1 = a
        let b1 = b
        func mySum(c: Int32, d: Int32) {
            print("testing nested function")
            return c + d
        }
        return mySum(a1, b1)
    }
}

main() {
    let a = A()
    print("${a.getX()}\n")
    0
}

/*
    let y = """
        this is multiple lines of codes.
        line 2 starts
        line 3 starts

    """
 */
