// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

open class A {
    var x: Int64 = 0
    protected open func g() {
        println("A::g()")
    }
}

class B <: A {
    protected override func g() {
        println("B::g()")
    }
    
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
  ==> lambda_24.cj:17:13:
   | 
17 |             this.x
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_24.cj:18:13:
   | 
18 |             this.g
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_24.cj:19:13:
   | 
19 |             this.g()
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_24.cj:20:13:
   | 
20 |             super.x
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_24.cj:21:13:
   | 
21 |             super.g
   |             ^ 
   | 

error: 'super' is not allowed to be captured in CFunc lambda expression
  ==> lambda_24.cj:22:13:
   | 
22 |             super.g()
   |             ^ 
   | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
