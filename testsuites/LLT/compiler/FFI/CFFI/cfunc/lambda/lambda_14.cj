// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


class A {
    public func get0() { 0 }
}

main() {
    let a = A()

    let f1: CFunc<() -> Int64> = { =>
        let f2 = { =>
            let f3 = { =>
                a.get0() // Should report error
            }
            f3()
        }
        f2()
    }

    let res = unsafe { f1() }
    println(res)

    return 0
}

/* SCAN
error: cannot capture variable a in CFunc lambda expression
  ==> lambda_14.cj:14:17:
   | 
14 |                 a.get0() // Should report error
   |                 ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
