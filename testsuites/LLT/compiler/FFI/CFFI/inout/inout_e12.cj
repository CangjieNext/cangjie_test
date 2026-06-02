// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

class A {
    func foo(ptr: CPointer<Int64>) { 0 }
}

main() {
    var a = A()
    var n = 0
    a.foo(inout n)
}

/* SCAN
error: 'inout' can only be used in a 'CFunc' calling
  ==> inout_e12.cj:10:11:
   | 
10 |     a.foo(inout n)
   |           ^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
