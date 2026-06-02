// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler --dump-parse %f
// (DEBUG_OPTION)EXEC: %frontendCompiler --dump-ast %f
// (DEBUG_OPTION)EXEC: %frontendCompiler --dump-tokens %f
macro package define

internal import std.sync.*
internal import std.ast.*

type A<T> = Option<T>

interface I {}

interface I2<T> <: I {}

class B<T> <: I2<T> where T <: ToString {
    static var vv: Int64 = 1
    mut prop v: Int64 {
        get() {
            vv
        }
        set(a) {
            vv = a
        }
    }
    func get(): This {
        this
    }
    static func foo<T>() {}
}

enum E<T> <: I where T <: ToString {
    E1 | E2(T)

    func test() {}
}

struct S<T> <: I where T <: ToString {}

extend Int64 <: I {
    static func f() {}
}

extend<T> S<T> <: I2<T> where T <: ToString {
    func test() {}
}

let (x1, x2) = (1, 3)

public macro test(a: Tokens): Tokens {
    return a
}

func test<T>() where T <: ToString {
    var a: (Int64) = 1
    let b = a is ToString
    let c = a as ToString
    spawn {
        if (let Some(d) <- c) {
            match (d) {
                case v: Int64 where v > 1 => match (v) {
                    case 1 => ()
                    case _ => ()
                }
                case _ => ()
            }
        }
        try {
            c.getOrThrow()
            throw Exception()
        } catch (e: Exception) {
        }
    }
    match {
        case a < 2 => ()
        case _ => ()
    }
    for (i in 1..4) {
        do {
            break
        } while (false)
    }
    Int64.f()
    let str = "123${a}"
    let f: (Int64) -> Unit
    let x = quote(a + b)
    let mtx = ReentrantMutex()
    synchronized(mtx) {
        let ins = B<Int64>()
        ins.v += 2
        a++
        let x = Array<Int64>()
        Int8(a)
        B<Int64>.foo<Int64>()
    }
}

main() {}
