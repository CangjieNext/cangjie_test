// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan AAA555444
// ASSERT: scan BBB111true

struct SSSS {
    public var xxxx: (Int64, Int32) = (555, Int32(444))
}

enum EXHAUSTIVE_ASSOCIATED_NONREF {
    A(SSSS) | B(Int64, Bool) | C
}

func foo(e: EXHAUSTIVE_ASSOCIATED_NONREF): Int64 {
    match (e) {
        case A(ssss) =>
            print("AAA");
            print(ssss.xxxx[0]);
            println(ssss.xxxx[1])
        case B(i64, b) =>
            print("BBB");
            print(i64);
            println(b)
        case C => println("CCC");
    }
    return 0
}

main() {
    foo(EXHAUSTIVE_ASSOCIATED_NONREF.A(SSSS()))
    foo(EXHAUSTIVE_ASSOCIATED_NONREF.B(111, true))
    return 0
}
