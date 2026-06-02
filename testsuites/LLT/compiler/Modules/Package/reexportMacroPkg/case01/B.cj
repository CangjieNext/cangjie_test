// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: maca
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt maca -o .
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

package B

public import A.*

@M1
func f() {}

/* SCAN
error: it is not allowed to re-export a macro package in a package.
  ==> B.cj:13:15:
   | 
13 | public import A.*
   |               ^ 
   | 

1 error generated, 1 error printed.
*/
