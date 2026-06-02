// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int32>): Int32

main() {
    var opt = Some(1)
    unsafe {
        println("${NonExist(inout opt)}")
    }
}

/* SCAN
error: the type of experssion qualified by 'inout' must meet 'CType' constraint
 ==> inout_e15.cj:8:29:
  | 
8 |         println("${NonExist(inout opt)}")
  |                             ^^^^^^^^^ 
  | 

error: mismatched types
 ==> inout_e15.cj:8:35:
  | 
8 |         println("${NonExist(inout opt)}")
  |                                   ^^^ expected 'Int32', found 'Enum-Option<Int64>'
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
