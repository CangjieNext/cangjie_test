// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1, 10, 100, 1000
// ASSERT: scan 3, 30, 300, 3000

@C
struct Data {
    var a = 0
    var b = 0
    var c = 0
    var d = 0
}

@C
func foo(d1: Data, d2: Data): Data {
    var d = Data()
    d.a = d1.a + d2.a + 1
    d.b = d1.b + d2.b + 10
    d.c = d1.c + d2.c + 100
    d.d = d1.d + d2.d + 1000
    d
}

func show(d: Data) {
    println("${d.a}, ${d.b}, ${d.c}, ${d.d}")
}

unsafe main() {
    var f = foo
    var d1 = Data()
    var d2 = Data()
    var d = foo(d1, d2)
    println("${d.a}, ${d.b}, ${d.c}, ${d.d}")
    d = f(d, d)
    println("${d.a}, ${d.b}, ${d.c}, ${d.d}")
    0
}
