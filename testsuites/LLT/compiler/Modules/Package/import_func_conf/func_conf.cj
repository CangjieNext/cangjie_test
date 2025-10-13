// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.pkg.cj
// EXEC: %compiler %n.pkg.cj %compile_lib_opt -o liba.%middle
// EXEC-PIPE: %compiler %f %cmp_opt liba.%middle 2>&1 | compare %f

import a.foo
import a.foo
import a.bar

main() {}

/* SCAN
warning: imported decl 'foo' is conflicted with other import
  ==> func_conf.cj:12:10:
   | 
12 | import a.foo
   |          ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: The previous was imported here
  ==> func_conf.cj:11:10:
   | 
11 | import a.foo
   |          ^^^ 
   | 

warning: unused import 'a.foo'
  ==> func_conf.cj:11:1:
   | 
11 | import a.foo
   | ^^^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused import 'a.foo'
  ==> func_conf.cj:12:1:
   | 
12 | import a.foo
   | ^^^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused import 'a.bar'
  ==> func_conf.cj:13:1:
   | 
13 | import a.bar
   | ^^^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
