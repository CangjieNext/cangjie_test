// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

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

public func foo<T>(t: T): Unit where T <: ToString{
    let temp: EnumA<T> = A2(B2(C2(t)))

    let str = match(temp) {
        case A1 => "A"
        case A2(B1) => "AB"
        case A2(B2(C1)) => "ABC1"
        case A2(B2(C2(x))) => println("associatedValueOfEnumC=${x}"); "ABC2"
    }
    println("matchTempResult=${str}")
}

main(): Unit {
    foo(())
    foo(100)
    foo("aoeu")
}

/* SCAN
associatedValueOfEnumC=()
matchTempResult=ABC2
associatedValueOfEnumC=100
matchTempResult=ABC2
associatedValueOfEnumC=aoeu
matchTempResult=ABC2
*/