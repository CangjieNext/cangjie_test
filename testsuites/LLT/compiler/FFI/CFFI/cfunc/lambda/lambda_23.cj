// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

open class A {
    var x: Int64 = 0
    func g() {
        println("A::g()")
    }
}

class B <: A {
    func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            this.x
            this.g
            this.g()
            super.x
            super.g
            super.g()
        }
        fn
    }
}

main() {}

/* SCAN
error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:13:13:
   | 
13 |             this.x
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:14:13:
   | 
14 |             this.g
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:15:13:
   | 
15 |             this.g()
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:16:13:
   | 
16 |             super.x
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:17:13:
   | 
17 |             super.g
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_23.cj:18:13:
   | 
18 |             super.g()
   |             ^ 
   | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
