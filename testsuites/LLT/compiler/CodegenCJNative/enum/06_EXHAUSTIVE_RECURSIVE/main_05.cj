// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan E2:C(e1)E1:B(e2)777

enum EXHAUSTIVE_RECURSIVE_01 {
    B(EXHAUSTIVE_RECURSIVE_02)
}

enum EXHAUSTIVE_RECURSIVE_02 {
    C(EXHAUSTIVE_RECURSIVE_01) | D(Int32)
}

func matchEnum<T>(e: T): Int64 {
    if (e is EXHAUSTIVE_RECURSIVE_01) {
        var e1 = e as EXHAUSTIVE_RECURSIVE_01
        match (e1.getOrThrow()) {
            case B(e2) =>
                print("E1:B(e2)");
                matchEnum<EXHAUSTIVE_RECURSIVE_02>(e2)
        }
    } else if (e is EXHAUSTIVE_RECURSIVE_02) {
        var e2 = e as EXHAUSTIVE_RECURSIVE_02
        match (e2.getOrThrow()) {
            case C(e1) =>
                print("E2:C(e1)");
                matchEnum<EXHAUSTIVE_RECURSIVE_01>(e1)
            case D(i32) => println(i32)
        }
    }
    return 0
}

main() {
    var v2 = EXHAUSTIVE_RECURSIVE_02.C(EXHAUSTIVE_RECURSIVE_01.B(EXHAUSTIVE_RECURSIVE_02.D(777)))
    matchEnum(v2)
    return 0
}
