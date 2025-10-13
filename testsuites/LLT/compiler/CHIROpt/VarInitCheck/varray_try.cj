// ERRCHECK: %compiler %cmp_opt -Woff all %n.cj 2>&1 | compare %f

func foo() {
   var a : VArray<Int64, $5>
   try {
      a[1] = 1
   } catch (_) {
      println(a[1])
   } finally {
      println("${a[1]}")
   }
   println("${a[1]}")
}

main() {
    0
}

/* SCAN
error: variable 'a' is used before initialization
 ==> varray_try.cj:8:15:
  | 
8 |       println(a[1])
  |               ^ 
  | 

error: variable 'a' is used before initialization
  ==> varray_try.cj:10:18:
   | 
10 |       println("${a[1]}")
   |                  ^ 
   | 

error: variable 'a' is used before initialization
  ==> varray_try.cj:12:15:
   | 
12 |    println("${a[1]}")
   |               ^ 
   | 

3 errors generated, 3 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
