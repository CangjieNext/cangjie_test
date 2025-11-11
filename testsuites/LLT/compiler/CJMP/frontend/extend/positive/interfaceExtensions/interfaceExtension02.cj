// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

open public class Foo{
    public init(){}
}
common public interface I1{
     common func f1():Unit{println("I1:f1")}
     static func f2():Unit{println("I1:f2")}
     static func f3():Unit{println("I1:f3")}
}

common extend Foo <:I1 {
  common public func f1():Unit{println("Extend::Foo::f1")}
  static public func f3():Unit{f2()}

}
extend Foo {
}

public struct B{
    public init(){}
}
common extend B<:I1 {
     public func f1():Unit{println("Extend::B::f1")}
     static public func f2():Unit{f3()}
}
enum E{F|H}

common extend E<:I1 {
     common public func f1():Unit{println("Extend::E::f1")}
     static public func f2():Unit{f3()}
}

extend String {
    func printSize() {
        print(this.size)
    }
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform public interface I1{
}

platform extend Foo <:I1{
}
platform extend B <:I1{
}

platform extend E<:I1 {

}

main(){
    var x:I1 = B()

    x.f1()
    B.f2()
    B.f3()

    Foo().f1()
    Foo.f3()

    F.f1()
    E.f3()
    "123".printSize() 
}

/* SCAN
Extend::B::f1
I1:f3
I1:f3
Extend::Foo::f1
I1:f2
Extend::E::f1
I1:f3
3*/
