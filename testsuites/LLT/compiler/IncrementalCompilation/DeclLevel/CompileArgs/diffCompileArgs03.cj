// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %enableConstPropagation %disableConstPropagation %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// 编译参数虽然发生了变化，但一正一负相互抵消了，这个不会触发全量编译
var a:Int64 = 5
var b:Int64 = a
let c:Int64 = b + a
var d:Int64 = if (true) { b - a } else { a }
var e:Int64 = try { func foo() { var x = 1; var y = x;}; foo(); b} finally { a }
let f:Int64 = b + 2
let g:Int64 = if (false) { func foo1() { var z = f + e }; foo1(); 2} else {3}
let h:Int64 = c
var i:Int64 = c

func goo() : Int64 {
    var g1 = c
    return g1
}

func goo2() : Int64 {
    var g2 = goo()
    return g2
}

func goo3() : Int64 {
    func goo31() {
        var x = h
    }
    return 1
}

func goo4() : Int64 {
    var g4 = goo3()
    return g4
}

main() : Int64 {
    var g3 = goo2()
    return g3 - h
}

// ASSERT: scan no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
