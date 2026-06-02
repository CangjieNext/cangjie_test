// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// ERRCHECK: %compiler %cmp_opt %f -o %output

internal import pkg2.foo

main() {
    test()
}

/* SCAN
error: undeclared identifier 'test'
  ==> main.cj:15:5:
   | 
15 |     test()
   |     ^ 
   | 

1 error generated, 1 error printed.
*/
