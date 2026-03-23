// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

// Regression test for Issue #746: nested generic enum pattern matching
// produces incorrect results at -O0/-O1.

public enum EnumA<T> {
    | A1
    | A2(EnumB<T>)
}

public enum EnumB<T> {
    | B1
    | B2(EnumC<T>)
}

public enum EnumC<T> {
    | C1
    | C2(T)
}

public func foo<T>(t: T): Unit {
    let temp: EnumA<T> = A2(B2(C2(t)))
    let str = match (temp) {
        case A1 => "A"
        case A2(B1) => "AB"
        case A2(B2(C1)) => "ABC1"
        case A2(B2(C2(_))) => "ABC2"
    }
    println(str)
}

main(): Unit {
    foo(())      // generic parameter Unit
    foo(1)       // generic parameter Int64
    foo("aoeu")  // generic parameter String
}

/* SCAN
ABC2
ABC2
ABC2
*/
