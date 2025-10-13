// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

let arrayE: Array<EEEE> = [EEEE.BBB]

enum EEEE {
    defaultValue
    | AAA(FFFF, FFFF)
    | BBB
}

enum FFFF {
    defaultValue
    | XXX(Range<UInt16>, Array<EEEE>, Float64)
    | YYY(UInt8)
    | ZZZ
}

private func foo(): Bool {
    match (arrayE[0]) {
        case AAA(field1OfAAA, YYY(fieldOfYYY)) => false
        case _ => true
    }
}

main(): Int64 {
    var counter: Int = 0;
    do {
        counter++
    } while (foo() && counter < 100)
    return 0
}
