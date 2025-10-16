// ERRCHECK:%compiler %cmp_opt %n.cj 2>&1 | compare %f

public func foo1() {
    var a: Int32
    var b: Int32
    do {
        a = 1
    } while (a == 0 && b == 0)
    println(a)
}

public func foo2() {
    do {
        var a: Int32
        println(a)
    } while (false)
}

main() : Int32 {
    return 0
}

/* SCAN
error: variable 'b' is used before initialization
 ==> do_while1.cj:8:24:
  | 
8 |     } while (a == 0 && b == 0)
  |                        ^ 
  | 

error: variable 'a' is used before initialization
  ==> do_while1.cj:15:17:
   | 
15 |         println(a)
   |                 ^ 
   | 

2 errors generated, 2 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
