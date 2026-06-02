// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


func test(a: Int64) {
    let f1: CFunc<() -> Int64> = { =>
        a
    }
    unsafe { f1() }
}

main() {
    test(1)

    return 0
}

/* SCAN
error: cannot capture variable a in CFunc lambda expression
 ==> lambda_5.cj:6:9:
  | 
6 |         a
  |         ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
