// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

func foo(ptr: CPointer<Int64>) { 0 }

main() {
    var a = 0
    foo(inout a)
}

/* SCAN
error: 'inout' can only be used in a 'CFunc' calling
 ==> inout_e11.cj:7:9:
  | 
7 |     foo(inout a)
  |         ^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
