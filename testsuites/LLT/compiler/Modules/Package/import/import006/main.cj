// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt pkg1/A.%middle %n.cj --import-path pkg1 2>&1 | compare %f

import pkg1.*

package pkg2

main() {
    return 0
}

/* SCAN
error: expected declaration, found keyword 'package'
  ==> main.cj:14:1:
   | 
14 | package pkg2
   | ^^^^^^^ expected declaration here
   | 
   # note: only declarations or macro expressions can be used in the top-level

1 error generated, 1 error printed.
*/
