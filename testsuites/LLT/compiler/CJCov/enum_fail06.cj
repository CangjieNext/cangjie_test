// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix 2>&1 | compare %f

enum E {
    X | Y(Int64)

    operator func ()(a: Float64) {
        print("operator func () in enum\n")
        a
    }
}

main() {
    let res = Y(1.0)
    1
}

/* SCAN
error: cannot convert a floating-point literal to type 'Int64'
  ==> enum_fail06.cj:19:17:
   | 
19 |     let res = Y(1.0)
   |                 ^ 
   | 

1 error generated, 1 error printed.
*/
