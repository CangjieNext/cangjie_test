// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: a.cj
// EXEC-PIPE-1: %compiler %cmp_opt a.cj %f -o %output 2>&1 | compare %f

package test

main(): Int64 {
    let a: Foos = Foos()

    a.foos.toArray()
    a.foos.contains(Foo("1"))
    return 0
}

/* SCAN
error: no matching function declaration for function call 'contains'
  ==> test.cj:17:12:
   | 
17 |     a.foos.contains(Foo("1"))
   |            ^ 
   | 
note: to use the following extension, import 'Class-ArrayList<Generics-T>'
   ==> (package std.collection)array_list.cj:757:1:

1 error generated, 1 error printed.
*/
