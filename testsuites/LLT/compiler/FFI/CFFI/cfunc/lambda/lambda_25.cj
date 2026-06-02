// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

class A {}

extend A {
    func g() {
        println("A::g()")
    }

    func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            g
            g()
        }
        fn
    }
}

main() {}

/* SCAN
error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_25.cj:12:13:
   | 
12 |             g
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_25.cj:13:13:
   | 
13 |             g()
   |             ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
