// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC:%compiler %cmp_opt %n.cj -o %output
// (CJNATIVE) EXEC:%run %run_opt %output %run_args

package b

import std.core.*
import std.ast.*

func Head() {
    0
}

@When[backend == "cjnative"]
@C
public struct mr1 {}

@When[backend == "cjnative"]
class mc1 {}

@When[backend == "cjnative"]
class mc2 {}

@When[backend == "cjnative"]
class mc3 {}

@When[backend == "cjnative"]
class mc4 {}

@When[backend == "cjnative"]
class mc5 {}

@When[backend == "cjnative"]
foreign {
    func A(): Unit

    func B(): Unit
}

@When[backend == "cjnative"]
foreign {
    func C(): Unit

    func D(): Unit
}

@When[backend == "cjnative"]
foreign func E(): Unit

@When[backend == "cjnative"]
foreign func F(): Unit

func Mid() {
    0
}

@When[backend == "cjnative"]
@C
public struct mr2 {}

func Tail() {
    0
}

main(): Int64 {
    var a = mc1()
    var b = mc2()
    var c = mc3()
    var d = mc4()
    var e = mc5()

    var f = mr1()
    var g = mr2()
    Head()
    Mid()
    Tail()
    return 0
}
