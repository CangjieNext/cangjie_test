/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_002

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that this, super, tuple, function name and call, match, 
                loops, try, is, as, range, synchronized and spawn, increment and
                decrement clauses can be valid expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/
import std.sync.*        
import utils.assert.Assert

var i: Int64   = Assert.getRuntimeZero()
let b: Bool    = Assert.getRuntimeZero() == 0
let f: Float64 = 3.14
let c: Rune    = 'c'

let str   : String        = "Hello"
let arrI8 : Array<UInt8>  = [72, 101, 108, 108, 111]
let arrStr: Array<String> = ["This", "is", "me"]

func simpleFunction() {}

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

open class C1 {
    open public func verifyExpression() {
        this
    }
} 

open class C2 <: C1 {
    override open public func verifyExpression() {
        this 
        super.verifyExpression()
    }
}

let mutex = Mutex()
var cnt = 0

func foo(): Future<Unit> {
    return spawn {
        var unit = synchronized(mutex) { 
            cnt++ 
        }
    }
}

main(): Int64 {
    i > 0
    "abc" == "def"

    let unused = match("any") { 
        case _ => "a string" 
    }

    if(i != 0) { 
        println("Hello there")
    } else { 
        println("Goodbye there")
    }

    for (item in arrI8) {
        print(i)
    }

    try { 
        i++ 
    } catch (_) {
        print("Should not reach here")
    }

    for (i in 0..5) {
        print(i)
    }

    try { 
        throw Exception() 
    } catch (_) { 
        print("Exception thrown")
    } 

    i is Int8
    i as Int8

    foo()
    
    C1().verifyExpression()
    C2().verifyExpression()

    0..2
    i..150 : 3

    return 0
}
