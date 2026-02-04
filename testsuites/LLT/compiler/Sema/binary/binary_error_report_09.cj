// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %enableO2 %cmp_opt %n.cj -o %output 2>&1 |compare %f

class Test {
    operator func +(other: Test) {
        return this + other  // recursive call without return type
    }
}

main() {
    let a = Test()
    let b = Test()
    let c = a + b
}

/* SCAN
error: unable to infer return type, please add type annotation
 ==> binary_error_report_09.cj:2:19:
  | 
2 |     operator func +(other: Test) {
  |                   ^ 
  | 
note: with recursive usage from
 ==> binary_error_report_09.cj:3:16:
  | 
3 |         return this + other
  |                ^^^^^^^^^^^^ 
  | 

error: invalid binary operator '+' on type 'Class-Test' and 'Class-Test'
  ==> binary_error_report_09.cj:10:15:
   | 
10 |     let c = a + b
   |               ^ 
   | 
   # note: you may want to implement 'operator func +(right: Class-Test)' for type 'Class-Test'

2 errors generated, 2 errors printed.
*/
