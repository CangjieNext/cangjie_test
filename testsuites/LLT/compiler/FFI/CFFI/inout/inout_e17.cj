// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Int32

struct A {
    public prop i: Int64 {
        get() { 0 }
    }
}

main() {
    var a = A()
    unsafe {
        NonExist(inout a.i)
    }
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e17.cj:14:24:
   | 
14 |         NonExist(inout a.i)
   |                        ^^^ temporary value
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
