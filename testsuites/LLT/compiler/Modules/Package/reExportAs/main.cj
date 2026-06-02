// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p1 -o p1.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p2 -o p2.%middle 
// EXEC-PIPE-1: %compiler %noColor p1.%middle p2.%middle %f 2>&1 | compare %f

internal import p2.foo
internal import p2.foo2

main() {
    foo()
    foo2()
}

/* SCAN
error: 'foo' is not accessible in package 'p2'
  ==> main.cj:12:17:
   | 
12 | internal import p2.foo
   |                 ^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
