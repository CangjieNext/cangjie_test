// ERRCHECK:%compiler %cmp_opt %n.cj 2>&1 | compare %f

public func foo1() {
    while (true) {
        let a: Int32
        try {
            a = 1
        } finally {
        }
    }
}

public func foo2() {
    while (true) {
        let a: Int32
        try {
            a = 1
        } catch(_) {
            a = 2
        } finally {
        }
    }
}

public func foo3() {
    let a: Int32
    try {
        while (true) {
            a = 1
        }
    } finally {
        a = 2
    }
}

public func foo4() {
    try {
        let a: Int32
        while (true) {
            a = 1
        }
    } finally {
    }
}

main() : Int32 {
    return 0
}

/* SCAN
error: cannot assign to immutable value
  ==> while_and_try1.cj:19:13:
   | 
19 |             a = 2
   |             ^^^^^ 
   | 
note: variable 'a' is immutable
  ==> while_and_try1.cj:15:13:
   | 
15 |         let a: Int32
   |             ^ 
   | 

error: cannot assign to immutable value
  ==> while_and_try1.cj:29:13:
   | 
29 |             a = 1
   |             ^^^^^ 
   | 
note: variable 'a' is immutable
  ==> while_and_try1.cj:26:9:
   | 
26 |     let a: Int32
   |         ^ 
   | 

error: cannot assign to immutable value
  ==> while_and_try1.cj:40:13:
   | 
40 |             a = 1
   |             ^^^^^ 
   | 
note: variable 'a' is immutable
  ==> while_and_try1.cj:38:13:
   | 
38 |         let a: Int32
   |             ^ 
   | 

3 errors generated, 3 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
