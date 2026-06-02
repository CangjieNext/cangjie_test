// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// (Windows)EXEC-PIPE: (set cjHeapSize=16GB) && %run %run_opt %output %run_args
// (Linux)EXEC-PIPE: export cjHeapSize=16GB && %run %run_opt %output %run_args

import std.random.*
import std.collection.*
import std.collection.concurrent.*
import std.runtime.*

var gl: Load = Load()
public var intaaa: Int64 = 2
var gc: C = C()

class Load {
    var test: Test = Test()
}

class Test {
    var test: Int16 = Int16(0)
}

func testLoad() {
    var a1: Array<Load> = [Load(), Load(), Load(), Load(), Load(), Load(), Load(), Load(), Load()]
    a1[intaaa] = Load()
    return a1[2]
}

class C {
    var dd: D = D()
    func cc(): Test {
        dd.testOption(Load())
    }
}

class D {
    func isXXX(A: Option<Load>): Bool {
        match (A) {
            case Some(Load) => return A.getOrThrow().test.test == 0
            case None => return false
        }
    }

    func testOption(LL: Load): Test {
        if (isXXX(LL)) {
            testLoad()
        }
        var tt = LL.test
        var xx = tt.test
        println(xx)
        return tt
    }
}

main(): Int64 {
    var c = C()
    var tt: Test = c.cc()
    var L: Load = Load()
    L.test = tt
    gl = L
    return 0
}
