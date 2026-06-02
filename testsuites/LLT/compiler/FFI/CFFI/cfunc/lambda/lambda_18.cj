// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


main() {
    let f0 = { n: Int64 =>
        let f1: CFunc<() -> Int64> = { =>
            let f2 = { =>
                let f3 = { =>
                    n
                }
                f3()
            }
            f2()
        }
        unsafe { f1() } - 1
    }

    return f0(1)
}

/* SCAN
error: cannot capture variable n in CFunc lambda expression
 ==> lambda_18.cj:9:21:
  | 
9 |                     n
  |                     ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
