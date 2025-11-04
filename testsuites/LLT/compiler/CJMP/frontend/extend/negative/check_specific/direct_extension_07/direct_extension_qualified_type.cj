// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// SEPARATE-FILE: mp1/test_imp.cj
// EXEC-0: %compiler %noColor --experimental mp1/test_imp.cj --output-type=dylib  --output-dir=./mp1
package mp1

public class A<T> {}


// SEPARATE-FILE: mp/test_comm.cj
// EXEC-0:: %compiler %noColor --experimental mp/test_comm.cj -L ./mp1 -lmp1 --output-type=chir --output-dir   ./mp
package mp

import mp1

public class B<T> {
    public var a: T
    public init(a: T) {
        this.a = a
    }
}

common extend<T> mp1.A<T> {
    public common func foo1(a: B<Int64>) {
        a.a
    }
    public common static func foo2(a: B<Int64>) {
        a.a
    }
}

public func f1() {
    return mp1.A<Int64>().foo1(B<Int64>(1)) + mp1.A<B<Int64>>.foo2(B<Int64>(1))
}

// SEPARATE-FILE: mp/test_plat.cj
// EXEC-PIPE-1: %compiler %noColor --experimental mp/test_plat.cj -L ./mp1 -lmp1  ./mp/mp.chir --common-part-cjo=./mp/mp.cjo  --output-type=dylib --output-dir ./mp  2>&1 | compare %f
package mp

platform extend<T> mp1.A<T> {
    public platform func foo1(a: B<Int64>) {
        a.a + 1
    }
    public platform static func foo2(a: B<Int64>) {
        a.a + 1
    }
}

public func f2() {
    return mp1.A<Int64>().foo1(B<Int64>(1)) + mp1.A<B<Int64>>.foo2(B<Int64>(1))
}

main() {}

/* SCAN
error: undeclared type name 'mp1'
 ==> mp/test_plat.cj:4:20:
  | 
4 | platform extend<T> mp1.A<T> {
  |                    ^ 
  | 

error: undeclared type name 'A'
 ==> mp/test_plat.cj:4:24:
  | 
4 | platform extend<T> mp1.A<T> {
  |                        ^ 
  | 

error: undeclared identifier 'mp1'
  ==> mp/test_plat.cj:14:12:
   | 
14 |     return mp1.A<Int64>().foo1(B<Int64>(1)) + mp1.A<B<Int64>>.foo2(B<Int64>(1))
   |            ^ 
   | 

error: undeclared identifier 'mp1'
  ==> mp/test_plat.cj:14:47:
   | 
14 |     return mp1.A<Int64>().foo1(B<Int64>(1)) + mp1.A<B<Int64>>.foo2(B<Int64>(1))
   |                                               ^ 
   | 

error: 'platform' function 'foo1' can not find 'common' match
 ==> mp/test_plat.cj:5:5:
  | 
5 |       public platform func foo1(a: B<Int64>) {
  |  _____^
6 | |         a.a + 1
7 | |     }
  | |_____^
  | 

error: 'platform' function 'foo2' can not find 'common' match
  ==> mp/test_plat.cj:8:5:
   | 
8  |       public platform static func foo2(a: B<Int64>) {
   |  _____^
9  | |         a.a + 1
10 | |     }
   | |_____^
   | 

error: 'common' extend 'A<T>' can not find 'platform' match
  ==> mp/test_comm.cj:25:8:

error: 'platform' extend '' can not find 'common' match
  ==> mp/test_plat.cj:4:10:
   | 
4  |   platform extend<T> mp1.A<T> {
   |  __________^
5  | |     public platform func foo1(a: B<Int64>) {
   | | ...
11 | | }
   | |_^
   | 

8 errors generated, 8 errors printed.
*/
