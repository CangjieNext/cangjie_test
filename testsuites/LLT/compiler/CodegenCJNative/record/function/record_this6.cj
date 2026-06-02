// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f

main(): Int64 {
    return run()
}

class A {
    public var a = 2
}

struct Data {
    public var width: Int64
    let length: Int64
    var a: A = A()
    public init(w: Int64, l: Int64) {
        width = w
        length = l
        let lambda = {a: Int64 => width - length}
        func f() {
            var b = width
            let lambda1 = {a: Int64 => width - length}
            length = 4
            return 0
        }
        f()
    }
}

func run(): Int64 {
    let data: Data = Data(1, 2)
    data.a.a = 1
    if (data.a.a != 1) {
        return 1
    }
    return 0
}

/* SCAN
error: cannot assign to immutable value
  ==> record_this6.cj:28:13:
   | 
28 |             length = 4
   |             ^^^^^^^^^^ 
   | 
note: variable 'length' is immutable
  ==> record_this6.cj:19:9:
   | 
19 |     let length: Int64
   |         ^^^^^^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:24:35:
   | 
24 |         let lambda = {a: Int64 => width - length}
   |                                   ^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:24:43:
   | 
24 |         let lambda = {a: Int64 => width - length}
   |                                           ^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:26:21:
   | 
26 |             var b = width
   |                     ^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:27:40:
   | 
27 |             let lambda1 = {a: Int64 => width - length}
   |                                        ^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:27:48:
   | 
27 |             let lambda1 = {a: Int64 => width - length}
   |                                                ^ 
   | 

error: 'this' is not allowed to be captured in constructor of struct
  ==> record_this6.cj:28:13:
   | 
28 |             length = 4
   |             ^ 
   | 

7 errors generated, 7 errors printed.
*/
