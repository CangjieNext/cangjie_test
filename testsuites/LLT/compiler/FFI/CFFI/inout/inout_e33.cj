// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func cfoo(ptr: CPointer<Int64>): Unit

class A {
    var a = 0
    func foo() {
        unsafe { cfoo(inout a) }
    }
}

unsafe main() {
    0
}

/* SCAN
error: the variable qualified by 'inout' cannot be directly or indirectly derived from an instance of a 'class'
 ==> inout_e33.cj:8:29:
  | 
8 |         unsafe { cfoo(inout a) }
  |                             ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
