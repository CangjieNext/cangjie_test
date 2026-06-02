// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

struct B {
    public var b = 3
}

class C {
    public var c = 4
}

class A {
    var c = C()
    func foo() {
        B()
    }
}

main() {
    var a = A()
    a.foo().b
    a.c.c
    return 0
}

/* SCAN
warning: unused expression
  ==> testUnusedCode17.cj:27:5:
   | 
27 |     a.foo().b
   |     ^^^^^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedCode17.cj:28:5:
   | 
28 |     a.c.c
   |     ^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
