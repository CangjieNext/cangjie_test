// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


main() {
    let target = 101

    let f1: CFunc<() -> Int64> = { =>
        let f2 = {
            => target // Should report error
        }
        f2()
    }

    let res = unsafe { f1() }
    println(res)

    return 0
}

/* SCAN
error: cannot capture variable target in CFunc lambda expression
 ==> lambda_11.cj:9:16:
  | 
9 |             => target // Should report error
  |                ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
