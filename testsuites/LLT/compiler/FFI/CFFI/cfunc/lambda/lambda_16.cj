// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f



main() {
    let target = 101

    let f1: CFunc<() -> Int64> = { =>
        let n1 = 1
        let f2 = { =>
            func f3() {
                let f4 = { =>
                    func f5() {
                        let f6: CFunc<() -> Int64> = { =>
                            let f7 = { =>
                                func f8() {
                                    let a = target
                                    let b = n1
                                    a + b
                                }
                                f8()
                            }
                            f7()
                        }
                        unsafe { f6() }
                    }
                    f5() + n1
                }
                f4() + n1
            }
            f3() + n1
        }
        f2()
    }

    let res = unsafe { f1() }
    println(res)

    return 0
}

/* SCAN
error: cannot capture variable target in CFunc lambda expression
  ==> lambda_16.cj:17:45:
   | 
17 |                                     let a = target
   |                                             ^ 
   | 

error: cannot capture variable n1 in CFunc lambda expression
  ==> lambda_16.cj:18:45:
   | 
18 |                                     let b = n1
   |                                             ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
