// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

class A {
    var x: Int64 = 0
    func g() {
        println("A::g()")
    }
    func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            this.x
            this.g
            this.g()
        }
        fn
    }
}

main() {}

/* SCAN
error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_22.cj:10:13:
   | 
10 |             this.x
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_22.cj:11:13:
   | 
11 |             this.g
   |             ^ 
   | 

error: 'this' is not allowed to be captured in CFunc lambda expression
  ==> lambda_22.cj:12:13:
   | 
12 |             this.g()
   |             ^ 
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
