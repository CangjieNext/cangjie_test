// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
class Foo<T, U> {
    var x : T 
    var y : U
    static var z : Int64 = 1

    init(a : T, b : U) {
        x = a 
        y = b
    }
}

common extend<T, U> Foo<T, U> {
    common public mut prop a: T 
    common public mut prop b: U
    common public static mut prop c : Int64 {
        get() {
            z
        }
        set(value) {
            z = z - value + value
        }
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
specific extend<T, U> Foo<T, U> {
    specific public mut prop a: T {
        get() {
            x
        }
        set(value) {
            x = value
        }
    }
    specific public mut prop b: U {
        get() {
            y
        }
        set(value) {
            y = value
        }
    }
    specific public static mut prop c : Int64 {
        get() {
            z + z
        }
        set(value) {
            z = value
        }
    }
}



main() {
    let xxx = Foo<Int64, Float64>(0, 0.0)
    println(xxx.a)
    println(xxx.b)
    println(Foo<Int64, Float64>.c)
    xxx.a = 1
    xxx.b = 2.0
    Foo<String, Float64>.c = 3
    println(xxx.a)
    println(xxx.b)
    println(Foo<String, String>.c)
}

/* SCAN
0
0.000000
2
1
2.000000
6
*/









