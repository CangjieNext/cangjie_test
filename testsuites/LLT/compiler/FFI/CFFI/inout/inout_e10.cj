// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

main() {
    var a = 0
    var ptr = inout a
    return 0
}

/* SCAN-IN
error: expected expression after '=', found keyword 'inout'
 ==> inout_e10.cj:5:15:
  | 
5 |     var ptr = inout a
  |               ^^^^^ expected expression here
  | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
