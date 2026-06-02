// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt pkg1/A.%middle %n.cj --import-path pkg1 2>&1 | compare %f

package pkg2

main() {
    return 0
}
import pkg2.pkg1.*

/* SCAN
error: expected declaration, found keyword 'import'
  ==> main.cj:16:1:
   | 
16 | import pkg2.pkg1.*
   | ^^^^^^ expected declaration here
   | 
   # note: only declarations or macro expressions can be used in the top-level

1 error generated, 1 error printed.
*/
