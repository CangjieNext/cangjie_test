// DEPENDENCE: define.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_macro define.cj
// ERRCHECK: %run_macro %set_stdx_path %compiler %cmp_opt  %f -o %output

import define.*

@Same(
import stdx.net.http.*
main() {
    return 0
}
)

/* SCAN
error: expected declaration, found keyword 'import'
 ==> import.cj:8:1:
  | 
8 | import stdx.net.http.*
  | ^ expected declaration here
  | 
  # note: only declarations or macro expressions can be used in the top-level
note: the error occurs after the macro is expanded
  ==> import.cj:7:1:
   | 
7  |   @Same(
   |  _^
8  | | import stdx.net.http.*
   | | ...
12 | | )
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */import stdx.net.http.*
   |  _^
   | | /* 7.2 */main() {
   | | /* 7.3 */    return 0
   | | /* 7.4 */}
   | | /* 7.5 */
   | |_________^
   | 
note: which is expanded as follows
  | 
  | /* 7.1 */import stdx.net.http.*
  |          ^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

