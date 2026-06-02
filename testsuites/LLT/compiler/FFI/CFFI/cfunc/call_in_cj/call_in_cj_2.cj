// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1, 10
// ASSERT: scan 6, 60

@C
struct Data {
    var a = 0
    var b = 0
}

@C
func foo(d1: Data, d2: Data, d3: Data, d4: Data, d5: Data): Data {
    var d = Data()
    d.a = d1.a + d2.a + d3.a + d4.a + d5.a + 1
    d.b = d1.b + d2.b + d3.b + d4.b + d5.b + 10
    d
}

func show(d: Data) {
    println("${d.a}, ${d.b}")
}

unsafe main() {
    var d1 = Data()
    var d2 = Data()
    var d3 = Data()
    var d4 = Data()
    var d5 = Data()
    var d = foo(d1, d2, d3, d4, d5)
    show(d)
    var f = foo
    d = f(d, d, d, d, d)
    show(d)
    0
}
