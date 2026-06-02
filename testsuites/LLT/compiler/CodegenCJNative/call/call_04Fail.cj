// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

func foo() {
    return goo
}

func goo(x: Float64, y!: Float64 = 1.0) {
    x
}

main() {
    let a = 1
    let res = foo()(1.0, 1.0, 1.0)
}

/* SCAN
error: extra argument given for parameter list '(Float64, Float64)' in call
  ==> call_04Fail.cj:19:20:
   | 
19 |     let res = foo()(1.0, 1.0, 1.0)
   |                    ^^^^^^^^^^^^^^^ expected 2 arguments, found 3
   | 

1 error generated, 1 error printed.
*/
