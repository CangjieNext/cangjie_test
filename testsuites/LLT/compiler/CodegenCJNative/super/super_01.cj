// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f

open class A {
    public open func f(): Int32 {
        return 1
    }
}

open class B <: A {
    public var b: Int32
    public init() {
        b = super.f()
    }
    public open override func f(): Int32 {
        return 2
    }
}

open class C <: B {
    public var i: Int32 = f()
    public var d: Int32
    public init() {
        d = super.f()
    }
    public override func f(): Int32 {
        return 3
    }
}

func run(): Int64 {
    var test = C()
    var res1: Int32 = test.d // d = 2
    var res2: Int32 = test.i // i = 3
    var res3: Int32 = test.b // b = 1
    if (res1 == 2 && res2 == 3 && res3 == 1) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}

/* SCAN
error: instance member function 'f' cannot be accessed in the constructor of open class 'B'
  ==> super_01.cj:18:19:
   | 
18 |         b = super.f()
   |                   ^ 
   | 

error: instance member function 'f' cannot be accessed in the constructor of open class 'C'
  ==> super_01.cj:29:19:
   | 
29 |         d = super.f()
   |                   ^ 
   | 

error: 'f' is not allowed to be accessed before all member variables are initialized
  ==> super_01.cj:18:13:
   | 
18 |         b = super.f()
   |             ^ 
   | 

error: 'f' is not allowed to be accessed before all member variables are initialized
  ==> super_01.cj:26:27:
   | 
26 |     public var i: Int32 = f()
   |                           ^ 
   | 

error: 'f' is not allowed to be accessed before all member variables are initialized
  ==> super_01.cj:29:13:
   | 
29 |         d = super.f()
   |             ^ 
   | 

5 errors generated, 5 errors printed.
*/
