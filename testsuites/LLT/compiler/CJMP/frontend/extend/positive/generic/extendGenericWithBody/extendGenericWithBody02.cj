// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
import std.math.*
class Point<T> {
    var x : T 
    var y : T 

    init(a : T, b : T) {
        x = a 
        y = b
    }
}

common extend<T> Point<T> <: ToString where T <: Number<T> & ToString {
    common operator func -(): Point<T>
    common operator func +(right: Point<T>): Point<T>
    common operator func *(right: Point<T>): Point<T>
    public func toString(): String {
        return "(" + x.toString() + ", " + y.toString() + ")"
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
import std.math.*
specific extend<R> Point<R> <: ToString where R <: Number<R> & ToString {
    specific operator func -(): Point<R> {
        return Point(-x, -y)
    }
    specific operator func +(right: Point<R>): Point<R> {
        return Point(x + right.x, y + right.y)
    }
    specific operator func *(right: Point<R>): Point<R> {
        return Point(x * right.x, y * right.y)
    }
}



main() {
    let p1 = Point<Int64>(2, 3)
    let p2 = -p1 
    let p3 = p1 + p2
    let p4 = p1 * p2
    println(p1)
    println(p2)
    println(p3)
    println(p4)
}

/* SCAN
(2, 3)
(-2, -3)
(0, 0)
(-4, -9)
*/