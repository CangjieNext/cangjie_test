// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


main() {
    let a = 0
    let f = {
        => a
        let f1: CFunc<() -> Int64> = {
            => a
        }
        unsafe { f1() }
    }
    f()
}

/* SCAN
error: cannot capture variable a in CFunc lambda expression
 ==> lambda_8.cj:9:16:
  | 
9 |             => a
  |                ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
