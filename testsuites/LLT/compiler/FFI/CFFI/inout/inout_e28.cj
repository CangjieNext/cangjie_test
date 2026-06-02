// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int32>): Unit

enum Kind {
    | A(Int32)
    | B(Int32, Int32)

    func test() {
        match (this) {
            case A(v) =>
                unsafe { NonExist(inout v) }
            case B(a, b) =>
                unsafe {
                    NonExist(inout a)
                    NonExist(inout b)
                }
        }
    }
}

func foo(n: Int32): Int32 {
    unsafe { NonExist(inout n) }
    n
}

main() {
    0
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e28.cj:12:41:
   | 
12 |                 unsafe { NonExist(inout v) }
   |                                         ^ is a immutable variable
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e28.cj:15:36:
   | 
15 |                     NonExist(inout a)
   |                                    ^ is a immutable variable
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e28.cj:16:36:
   | 
16 |                     NonExist(inout b)
   |                                    ^ is a immutable variable
   | 

error: 'inout' can only qualify variable defined with 'var'
  ==> inout_e28.cj:23:29:
   | 
23 |     unsafe { NonExist(inout n) }
   |                             ^ is a immutable variable
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
