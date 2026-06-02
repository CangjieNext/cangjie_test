// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Data>): Unit

@C
struct Data {
    var a: Int32 = 0
}

main() {
    unsafe {
        NonExist(inout Data())
    }
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e9.cj:12:24:
   | 
12 |         NonExist(inout Data())
   |                        ^^^^^^ temporary value
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
