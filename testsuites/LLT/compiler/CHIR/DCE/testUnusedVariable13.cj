// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

interface I {}

class A <: I {
    A() {
        const aaaa = 1
    }

    func foo() {
        const bbbb = 1
    }
}

main() {
    A().foo()
    return 0
}

/* SCAN
warning: unused variable:'aaaa'
  ==> testUnusedVariable13.cj:14:15:
   | 
14 |         const aaaa = 1
   |               ^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'bbbb'
  ==> testUnusedVariable13.cj:18:15:
   | 
18 |         const bbbb = 1
   |               ^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
