// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Unit>): Int32

main() {
    var a = ()
    unsafe {
        NonExist(inout a)
    }
}

/* SCAN
error: the expression qualified by 'inout' cannot be of zero-sized type
 ==> inout_e18.cj:8:18:
  | 
8 |         NonExist(inout a)
  |                  ^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
