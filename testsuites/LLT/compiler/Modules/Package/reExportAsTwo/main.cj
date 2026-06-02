// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p1 -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p2 -o p2.%middle
// EXEC-PIPE-1: %compiler %noColor p1.%middle p2.%middle %f 2>&1 | compare %f

internal import p2.*

main(): Int64 {
    add(1, 2)
    var b = a
    var c = C()
    0
}

/* SCAN
error: undeclared identifier 'a'
  ==> main.cj:16:13:
   | 
16 |     var b = a
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
