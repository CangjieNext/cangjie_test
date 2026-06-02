// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

enum E {
    X | X(Int32)

    public operator func ()(a: Float64) {
        print("operator func () in enum\n")
        a
    }
}

main() {
    let a: Int64 = 1
    let res = X(a)
    0
}

/* SCAN
error: mismatched types
  ==> enum_fail07.cj:20:17:
   | 
20 |     let res = X(a)
   |                 ^ expected 'Float64', found 'Int64'
   | 

error: no matching function for operator '()' function call
  ==> enum_fail07.cj:20:15:
   | 
20 |     let res = X(a)
   |               ^ 
   | 

2 errors generated, 2 errors printed.
*/
