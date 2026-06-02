// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct K {
    public var a = 6
    public let b = 2
    public var c = this.a
    public var d = this
    public var c1 = {=> this}
    public var c2 = {=> 2 + this.a}

    public init() {}
    public func f() {
        a = 3
        this.a = 3
        func f1(l!: Int64 = this.a) {
            var c = this.a
            func f2() {
                a = 3
                this.a = 3
                print("${a} \n")
                return this.b
            }
            return this.a + f2()
        }
        return f1()
    }
}

main(): Int64 {
    var x = K().f()
    var x1 = K()
    x1.a = 2
    print("${x} \n")
    print("${x1.a} \n")
    return 0
}

/* SCAN
error: value type recursive detected: 'K->K'
 ==> record_this2.cj:9:1:
  | 
9 | struct K {
  | ^ 
  | 

error: 'this' is only allowed to be used inside constructor or function for struct
  ==> record_this2.cj:12:20:
   | 
12 |     public var c = this.a
   |                    ^ 
   | 

error: 'this' is only allowed to be used inside constructor or function for struct
  ==> record_this2.cj:13:20:
   | 
13 |     public var d = this
   |                    ^ 
   | 

error: 'this' is only allowed to be used inside constructor or function for struct
  ==> record_this2.cj:14:25:
   | 
14 |     public var c1 = {=> this}
   |                         ^ 
   | 

error: 'this' is only allowed to be used inside constructor or function for struct
  ==> record_this2.cj:15:29:
   | 
15 |     public var c2 = {=> 2 + this.a}
   |                             ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> record_this2.cj:19:9:
   | 
19 |         a = 3
   |         ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> record_this2.cj:20:9:
   | 
20 |         this.a = 3
   |         ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> record_this2.cj:24:17:
   | 
24 |                 a = 3
   |                 ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> record_this2.cj:25:17:
   | 
25 |                 this.a = 3
   |                 ^ 
   | 

9 errors generated, 9 errors printed.
*/
