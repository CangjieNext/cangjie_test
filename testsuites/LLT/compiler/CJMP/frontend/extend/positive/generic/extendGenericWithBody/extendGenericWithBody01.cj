// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
import std.math.*
class Foo<T>{ }
common extend<T> Foo<T> {
    common public func f1(): Unit {
        println("Extend::common::f1")
    }
    common static public func f2() : Unit {
        println("Extend::Common::static::f2")
    }
    common public func f3<R>(x : Option<R>, default : R) : R where R <: Number<R>
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
import std.math.*
specific extend<R> Foo<R> {
    specific public func f1(): Unit {
        println("Extend::Platform::f1")
    }
    specific static public func f2() : Unit {
        println("Extend::Platform::static::f2")
    }
    specific public func f3<R>(x : Option<R>, default : R) : R where R <: Number<R> {
        if(let Some(y) <- x) {
            y + y
        } else {
            default
        }
    }
}


main() {
    Foo<String>().f1()
    Foo<Int64>.f2()
    let res = Foo<String>().f3<Int64>(Some(100), 0)
    println(res)
}

/* SCAN
Extend::Platform::f1
Extend::Platform::static::f2
200
*/