// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class F {
    var a = 1
    init() {}
    init(this @local!) { exclave { } }
    init(this @local?) { exclave { } }
}
func f() {
    let x: F@local? = F()
    let h:(()->Unit)@~local = {
        => println(x.a)
    }

    let y: F@local! = F()
    func @local! m() {
        println(y.a)
    }
}

main() {
    f()
}

/* SCAN
error: cannot capture @local? variable 'x' in @~local lambda
  ==> lambda_bad.cj:18:20:
   | 
18 |         => println(x.a)
   |                    ^ 
   | 

error: cannot capture @local! variable 'y' in @local! function
  ==> lambda_bad.cj:23:17:
   | 
23 |         println(y.a)
   |                 ^ 
   | 

2 errors generated, 2 errors printed.
*/