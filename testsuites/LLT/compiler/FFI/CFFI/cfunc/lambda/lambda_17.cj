// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


class A {
    var a_: Int8 = 0

    public prop a: Int8 {
        get() { a_ }
    }
}

main() {
    let target = 101
    let a = A()
    let f = a.a

    let f1: CFunc<() -> Unit> = { =>
        let f2 = { =>
            f
        }
        0
    }

    unsafe { f1() }

    return 0
}

/* SCAN
error: cannot capture variable f in CFunc lambda expression
  ==> lambda_17.cj:19:13:
   | 
19 |             f
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
