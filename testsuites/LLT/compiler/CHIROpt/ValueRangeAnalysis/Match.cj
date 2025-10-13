// LEVEL: 0
// EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

enum A {
    I1(Int64)
    |I2(Int64, Int64)
    |I3
}
struct B {
    let a = 18
    var b = 19
    let c = A.I1(23)
}

enum C {
    T1 | T2 | T3
}

func f2() {
    B()
}
func f3() {
    A.I1(1)
}

func f1() {
    let a = [1,2,3]
    let b = [A.I1(1), A.I2(3,3), A.I3]
    let c = (A.I1(1), A.I2(3,3), A.I3)
    let d = (B(), B())
    let e = [B(), B()]
    f2().b == f2().a 
    return
}

main() {
    let a=A.I1(3)
    match (a) {
        case I1(m) where m >= 0 => 1
        case I1(m) where m < 0 => -1
        case I2(b1,c1) where b1 == c1 => 2
        case _ => 0
    }

    let f=3
    match(f*f) {
        case 1 => 1
        case 2 => 2
        case 3 => 3
        case 9 => 9
        case _ => 0
    }

    let c = C.T1
    match (c) {
        case T1 where true => 1
        case T2 => 2
        case _ => 3
    }

    return
}

// ASSERT: scan-not core dump
// ASSERT: regex-not Assertion .* failed


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
