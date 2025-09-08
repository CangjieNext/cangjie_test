// ERRCHECK:%compiler %cmp_opt %n.cj 2>&1 | compare %f

public func foo1() {
    var a: Int32
    do {
        if (true) {
            continue
        }
        a = 1
    } while (a == 0)
    println(a)
}

public func foo2() {
    var a: Int32
    do {
        if (true) {
            break
        }
        a = 1
    } while (a == 0)
    println(a)
}

public func foo3() {
    var a: Int32
    do {
        if (true) {
            return
        }
        a = 1
    } while (a == 0)
    println(a)
}

public func foo4() {
    var a: Int32
    do {
        if (true) {
            throw Exception()
        }
        a = 1
    } while (a == 0)
    println(a)
}

main() : Int32 {
    return 0
}

/* SCAN
error: variable 'a' is used before initialization
  ==> do_while2.cj:10:14:
   | 
10 |     } while (a == 0)
   |              ^ 
   | 

error: variable 'a' is used before initialization
  ==> do_while2.cj:11:13:
   | 
11 |     println(a)
   |             ^ 
   | 

error: variable 'a' is used before initialization
  ==> do_while2.cj:21:14:
   | 
21 |     } while (a == 0)
   |              ^ 
   | 

error: variable 'a' is used before initialization
  ==> do_while2.cj:22:13:
   | 
22 |     println(a)
   |             ^ 
   | 

4 errors generated, 4 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
