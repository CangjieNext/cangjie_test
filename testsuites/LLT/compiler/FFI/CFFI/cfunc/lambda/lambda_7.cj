// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f



main() {
    func f() {
        0
    }

    let f1: CFunc<() -> Int64> = { =>
        f()
        let out = f
        out()
    }

    return 0
}

/* SCAN
error: cannot capture variable f in CFunc lambda expression
  ==> lambda_7.cj:11:9:
   | 
11 |         f()
   |         ^ 
   | 

error: cannot capture variable f in CFunc lambda expression
  ==> lambda_7.cj:12:19:
   | 
12 |         let out = f
   |                   ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
