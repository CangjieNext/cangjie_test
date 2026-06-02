// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func PlusOne(ptr: CPointer<Int32>): Unit

struct Data {
    var a: Int32 = 0
}

class A {
    var d = Data()
}

main() {
    let a = A()
    unsafe { PlusOne(inout a.d.a) }
}

/* SCAN
error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
  ==> inout_e5.cj:15:28:
   | 
15 |     unsafe { PlusOne(inout a.d.a) }
   |                            ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
