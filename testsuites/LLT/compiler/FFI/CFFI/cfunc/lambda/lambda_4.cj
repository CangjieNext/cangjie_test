// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


main() {
    let p1 = 2

    let f1: CFunc<(CPointer<UInt64>) -> Int64> = { ptr =>
        let p1 = 0
        let f2: CFunc<() -> Int64> = { =>
            p1
        }
        0
    }

    return 0
}

/* SCAN
error: cannot capture variable p1 in CFunc lambda expression
  ==> lambda_4.cj:10:13:
   | 
10 |             p1
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
