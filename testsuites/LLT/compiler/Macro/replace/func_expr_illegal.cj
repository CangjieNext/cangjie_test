// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

main() {
    @callTest 1+1 
    return 1
}

/* SCAN
error: expected declaration, found literal '1'
 ==> func_expr_illegal.cj:8:15:
  | 
8 |     @callTest 1+1 
  |               ^ expected declaration here
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

