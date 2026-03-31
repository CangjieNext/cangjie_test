// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public interface I { }
public interface C1 { }
public interface C2 { }

public class X<T> where T <: I {}

common extend <T> X<T> { 
    common public func f1(): Unit {
        println("Extend::common::f1")
    }
}

common extend <T> X<T> where T <: C1 {
    common public func f2(): Unit {
        println("Extend::common::f2")
    }
}

common extend <T> X<T> where T <: C2 { 
    common public func f3(): Unit {
        println("Extend::common::f3")
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific extend <T> X<T> { 
    specific public func f1(): Unit {
        println("Extend::specific::f1")
    }
}

specific extend <T> X<T> where T <: C1 {
    specific public func f2(): Unit {
        println("Extend::specific::f2")
    }
}

specific extend <T> X<T> where T <: C2 { 
    specific public func f3(): Unit {
        println("Extend::specific::f3")
    }
}

extend Int64 <: I & C1 & C2 { }

main() { 
    let x = X<Int64>()
    x.f1()
    x.f2()
    x.f3()
}
/* SCAN
Extend::specific::f1
Extend::specific::f2
Extend::specific::f3
*/