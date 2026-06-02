// LEVEL: 0
// EXEC:%compiler %debugCHIROpt %cmp_opt %disableConstPropagation %enableO2 %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

struct A {
    static var f = 1
    let a: Int64
    init() {
        a = f
    }
}

class B {
    static var f = 1
    let a: Int64
    init() {
        a = f
    }
}

enum C {
    Sm(Int64)
    | St(Int64, Int64)
}
let a1 = A()
var a2 = A()
let b1 = B()
var b2 = B()
let c1 = C.Sm(1)
var c2 = C.St(100, 1000)

main() {
    a2 = A()
    b2 = B()
    c2 = C.St(2, 3)
    a2.a == b2.a 
    A.f == B.f
    
    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: scan-not true
// ASSERT: scan-not false


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
