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

class Load {
    var testa: Int64 = 0
}

class Test {
    var test: Int16 = Int16(0)
}

func testLoad(): Load {
    var a1: Array<Load> = [Load(), Load(), Load(), Load(), Load(), Load(), Load(), Load(), Load()]
    a1[intaaa] = Load()
    return a1[2]
}

main(): Int64 {
    var Load = testLoad()
    println(Load.testa)
    var Load2 = testLoad()
    Load2.testa = 10
    println(Load.testa)
    return testLoad().testa
}
