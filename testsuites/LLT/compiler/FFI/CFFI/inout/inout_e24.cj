// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Unit

struct Data {
    var a: Int32 = 0
}

main() {
    let d = Data()
    unsafe { NonExist(inout d.a) }
    println(d.a)
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e24.cj:11:29:
   | 
11 |     unsafe { NonExist(inout d.a) }
   |                             ^ is a immutable variable
   | 

error: mismatched types
  ==> inout_e24.cj:11:29:
   | 
11 |     unsafe { NonExist(inout d.a) }
   |                             ^^^ expected 'Int64', found 'Int32'
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
