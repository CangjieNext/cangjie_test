// EXEC-PIPE-1: %compiler %noColor --experimental %f --output-type=chir 2>&1 | compare %f
package cmp

public common func foo(): Unit

public platform func foo(): Unit {
     println("platform foo")
}

/* SCAN
error: platform declaration must be defined in platform package part
 ==> platform_func_in_commonfile.cj:1:1:
  | 
1 | // EXEC-PIPE-1: %compiler %noColor --experimental %f --output-type=chir 2>&1 | compare %f
  | ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

