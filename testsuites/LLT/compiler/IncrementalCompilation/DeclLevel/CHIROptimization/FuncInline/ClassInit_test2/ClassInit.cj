// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %compile_hotpatch_opt %n.cj -o %output | compare %f
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %compile_hotpatch_opt %n.cj -o %output 2>&1

package A

class B {}

class Test {
    public var a : Int64 = 11
    public var b = B()
}

var t = Test()
public func foo() {
    println(t.a)
    let num = 1
    let fut = spawn {
        return num + 20
    }
    fut.get()
}

// ASSERT: scan a(l:11, c:5) -> t(l:15, c:1),
// ASSERT: scan b(l:12, c:5) -> t(l:15, c:1),


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
