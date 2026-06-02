// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Unit

struct Data {
    var a: Int32 = 0
}

func foo1(a!: Int64 = { =>
    let d = Data()
    unsafe { NonExist(inout d.a) }
    println(d.a)
    Int64(d.a)
}()) {
    a
}

func foo2(f!: () -> Int64 = { =>
    let d = Data()
    unsafe { NonExist(inout d.a) }
    println(d.a)
    Int64(d.a)
}) {
    f()
}

main() {
    foo1()
    foo2()
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e30.cj:11:29:
   | 
11 |     unsafe { NonExist(inout d.a) }
   |                             ^ is a immutable variable
   | 

error: mismatched types
  ==> inout_e30.cj:11:29:
   | 
11 |     unsafe { NonExist(inout d.a) }
   |                             ^^^ expected 'Int64', found 'Int32'
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e30.cj:20:29:
   | 
20 |     unsafe { NonExist(inout d.a) }
   |                             ^ is a immutable variable
   | 

error: mismatched types
  ==> inout_e30.cj:20:29:
   | 
20 |     unsafe { NonExist(inout d.a) }
   |                             ^^^ expected 'Int64', found 'Int32'
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
