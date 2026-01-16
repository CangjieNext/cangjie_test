// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public class Foo{
    public var x  = 1
    public init(){}
}
common public interface I1{
     common func f1():Unit{println("I1::f1")}
     static common func f2():Int64{3}

}
common public interface I2{
     common func f1():Unit{println("I2::f1")}
     static common func f2():Int64{3}
}
common extend Foo <:I1 & I2 {
    common public func f1():Unit
    public static common func f2():Int64
    common mut prop i:Int64 
    static common  prop z:Int64 
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
specific public interface I1{
}
specific public interface I2{
}
specific extend Foo <:I1 & I2 {
    specific public func f1():Unit{println("specific::I1::f1")}
    public static specific func f2():Int64{return 4}
    specific mut prop i:Int64 {
        get(){x}
        set(value){
            x = value
        }
    }
   static specific  prop z:Int64 {
     get(){5}
   }
}
main(){
    Foo().f1()
    var foo = Foo()
    foo.i = 5
    Foo.f2() - 4 + foo.x - 5 + Foo.z - 5
}

/* SCAN
specific::I1::f1
*/
