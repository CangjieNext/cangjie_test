// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    unsafe { PlusOne(inout 0) }
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
 ==> inout_e1.cj:6:28:
  | 
6 |     unsafe { PlusOne(inout 0) }
  |                            ^ literal
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
