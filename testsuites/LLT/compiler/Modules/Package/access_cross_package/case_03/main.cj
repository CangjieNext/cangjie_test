// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: utils
// EXEC: %compiler %compile_lib_opt -p utils -o libutils.%middle
// ERRCHECK: %compiler %cmp_opt %f libutils.%middle

package justtest

import justtest.utils

main(): Unit {
    let b = utils.fileExists()
    println(b)
}

/* SCAN
error: no matching function declaration for function call 'fileExists'
  ==> main.cj:16:19:
   | 
16 |     let b = utils.fileExists()
   |                   ^ 
   | 

error: internal 'fileExists' in package 'justtest.utils' cannot be obtained
  ==> main.cj:16:13:
   | 
16 |     let b = utils.fileExists()
   |             ^ 
   | 

2 errors generated, 2 errors printed.
*/
