// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<CFunc<() -> Unit>>): Int32

@C
func foo() {
    println("I'm foo")
}

main() {
    unsafe {
        NonExist(inout foo)
    }
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e16.cj:12:24:
   | 
12 |         NonExist(inout foo)
   |                        ^^^ not a variable
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
