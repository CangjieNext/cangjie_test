// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

@M1
private func foo() {}

main() {
}

/* SCAN
warning: unused function:'foo'
  ==> unused_function_1.cj:15:1:
   | 
15 | private func foo() {}
   | ^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
note: the warning originates in the macro `M1` (consider using `--debug-macro` for more info)
  ==> unused_function_1.cj:14:1:
   | 
14 |   @M1
   |  _^
15 | | private func foo() {}
   | |_____________________^
   | 

warning: the warning originates in the macro `M1` (consider using `--debug-macro` for more info)
  ==> unused_function_1.cj:14:1:
   | 
14 |   @M1
   |  _^
15 | | private func foo() {}
   | |_____________________^
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
note: unused function:'testM1'
   | 
   | private func testM1() { }
   | ^^^^^^^^^^^^^^^^^^^^^^^^^ unused function
   | 

2 warnings generated, 2 warnings printed.
*/
