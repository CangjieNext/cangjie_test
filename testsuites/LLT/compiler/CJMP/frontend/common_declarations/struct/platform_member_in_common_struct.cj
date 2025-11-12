// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp
common struct C{
    platform func a():Int32 {}
}
/* SCAN
error: function a is platform, but struct is not platform
 ==> c/c.cj:4:5:
  | 
4 |     platform func a():Int32 {}
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
