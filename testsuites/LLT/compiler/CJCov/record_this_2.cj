// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt %coverage_opt %f 2>&1 | compare %f

struct Test {
    let a: String
    let c: String
    let b: (Int32) -> String

    func foo(x: Int32): String {
        return x.toString()
    }
    func f(x: Int32): String {
        return a
    }
    init() {
        a = "100"
        c = "1"
        b = foo
    }
    init(x: Int32) {
        this()
        a = foo(1)
        c = f(1)
        b = this.b
        b = foo
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: String = test.b(1)
    if (res1 != "1") {
        return 1
    }
    var res2 = test.b
    if (res2(1) != "1") {
        return 1
    }

    var res3 = test.f
    if (res3(2) != "1") {
        return 1
    }
    var res4 = test.f(1)
    if (res4 != "1") {
        return 1
    }
    var res5 = test.foo
    if (res5(3) != "3") {
        return 1
    }
    var res6 = test.foo(1)
    if (res6 != "1") {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}

/* SCAN
error: 'foo' is not allowed to be accessed before all member variables are initialized
  ==> record_this_2.cj:23:13:
   | 
23 |         b = foo
   |             ^ 
   | 

error: cannot assign to immutable value
  ==> record_this_2.cj:27:9:
   | 
27 |         a = foo(1)
   |         ^^^^^^^^^^ 
   | 
note: variable 'a' is immutable
  ==> record_this_2.cj:10:9:
   | 
10 |     let a: String
   |         ^ 
   | 

error: cannot assign to immutable value
  ==> record_this_2.cj:28:9:
   | 
28 |         c = f(1)
   |         ^^^^^^^^ 
   | 
note: variable 'c' is immutable
  ==> record_this_2.cj:11:9:
   | 
11 |     let c: String
   |         ^ 
   | 

error: cannot assign to immutable value
  ==> record_this_2.cj:29:9:
   | 
29 |         b = this.b
   |         ^^^^^^^^^^ 
   | 
note: variable 'b' is immutable
  ==> record_this_2.cj:12:9:
   | 
12 |     let b: (Int32) -> String
   |         ^ 
   | 

error: cannot assign to immutable value
  ==> record_this_2.cj:30:9:
   | 
30 |         b = foo
   |         ^^^^^^^ 
   | 
note: variable 'b' is immutable
  ==> record_this_2.cj:12:9:
   | 
12 |     let b: (Int32) -> String
   |         ^ 
   | 

5 errors generated, 5 errors printed.
*/
