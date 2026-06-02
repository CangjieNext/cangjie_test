// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

// static member func
class A {
    static func foo() {}
    func bar() {
        let b = foo
        let c = b
        return 0
    }

    func bar1() {
        let b = foo
        let c = b
        return 0
    }
}

func moo() {
    let a = A.foo
    let b = a
}

main() {
    A().bar()
    A().bar1()
    moo()
    return 0
}

/* SCAN
warning: unused variable:'c'
  ==> testUnusedVariable09.cj:15:13:
   | 
15 |         let c = b
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'c'
  ==> testUnusedVariable09.cj:21:13:
   | 
21 |         let c = b
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testUnusedVariable09.cj:28:9:
   | 
28 |     let b = a
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
