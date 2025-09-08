// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a.cj
// EXEC: %compiler %compile_lib_opt a.cj -o liba.%middle
// ERRCHECK: %compiler %cmp_opt %f liba.%middle

package ab

import a.*

main() {
    foo()
}

/* SCAN
error: undeclared identifier 'foo'
  ==> ab.cj:16:5:
   | 
16 |     foo()
   |     ^ 
   | 

warning: unused import 'a.*'
  ==> ab.cj:13:1:
   | 
13 | import a.*
   | ^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 error generated, 1 error printed.
1 warning generated, 1 warning printed.
*/
