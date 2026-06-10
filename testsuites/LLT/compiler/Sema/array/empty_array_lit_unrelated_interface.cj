// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f 2>&1

main(): Int64 {
    let _: ToString = []
    0
}

/* SCAN
error: array literal type cannot be inferred
  ==> empty_array_lit_unrelated_interface.cj:10:23:
   | 
10 |     let _: ToString = []
   |                       ^ 
   | 

1 error generated, 1 error printed.
*/
