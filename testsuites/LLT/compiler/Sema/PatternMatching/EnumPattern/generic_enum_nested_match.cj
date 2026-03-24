// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1
// ASSERT: regex-not warning
// EXEC: %run %run_opt %output %run_args | compare %f

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

public func matchA<T>(a: EnumA<T>): String {
    match (a) {
        case A1 => "A"
        case A2(B1) => "AB"
        case A2(B2(C1)) => "ABC1"
        case A2(B2(C2(_))) => "ABC2"
    }
}

main(): Unit {
    println(matchA<Unit>(A2(B2(C2(())))))
    println(matchA<Int64>(A2(B2(C2(1)))))
    println(matchA<String>(A2(B2(C2("aoeu")))))
}

/* SCAN
ABC2
ABC2
ABC2
*/
