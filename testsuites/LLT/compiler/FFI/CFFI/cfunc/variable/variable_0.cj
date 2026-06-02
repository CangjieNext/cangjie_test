// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




foreign func printf(ptn: CString, ...): Int32

unsafe main() {
    var f = printf
    0
}

/* SCAN-IN
error: CFunc with variable-length parameters cannot be assigned to variables
 ==> variable_0.cj:9:13:
  | 
9 |     var f = printf
  |             ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
