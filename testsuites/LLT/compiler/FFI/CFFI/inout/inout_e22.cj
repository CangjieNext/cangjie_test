// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func PlusOne(ptr: CPointer<Int32>): Unit

struct Data {
    var a: Int32 = 0
}

struct A {
    var d = Data()
}

main() {
    let a = A()
    unsafe { PlusOne(inout a.d.a) }
    println(a.d.a)
    unsafe { PlusOne(inout a.d.a) }
    println(a.d.a)
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e22.cj:15:28:
   | 
15 |     unsafe { PlusOne(inout a.d.a) }
   |                            ^ is a immutable variable
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e22.cj:17:28:
   | 
17 |     unsafe { PlusOne(inout a.d.a) }
   |                            ^ is a immutable variable
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
