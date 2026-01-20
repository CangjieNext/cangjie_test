// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//SEPARATE-FILE: define.cj 
//EXEC-0: %compiler define.cj --compile-macro
macro package define 
import std.ast.*
public macro dprint(input: Tokens): Tokens {
    let inputStr = input.toString()
    let result = quote(
        print($(inputStr) + " = ")
        println($(input))
    )
    return result
}


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
    common static func calc(p1: Point<T>): Unit
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
import define.*
specific extend<T> Point<T> <: ToString where T <: Number<T> & ToString {
    specific operator func -(): Point<T> {
        return Point(-x, -y)
    }
    specific operator func +(right: Point<T>): Point<T> {
        return Point(x + right.x, y + right.y)
    }
    specific operator func *(right: Point<T>): Point<T> {
        return Point(x * right.x, y * right.y)
    }
    specific static func calc(p1: Point<T>): Unit {
        let p2 = -p1 
        @dprint(-p1)
        @dprint(p1 + p2)
        @dprint(p1 * p2)
    }
}



main() {
    Point.calc(Point<Int64>(1, 2))
}

/* SCAN
- p1 = (-1, -2)
p1 + p2 = (0, 0)
p1 * p2 = (-1, -4)
*/