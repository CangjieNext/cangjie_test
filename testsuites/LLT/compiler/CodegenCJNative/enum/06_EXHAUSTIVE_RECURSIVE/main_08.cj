// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex-auto matched01matched02

class AAAA {}

enum E1 {
    A(E2) | B
}

enum E2 {
    C(AAAA) | D
}

func test() {
    var a: E1 = E1.A(E2.D)
    match (a) {
        case A(v) =>
            print("matched01");
            match (v) {
                case C(m) => print("fail01")
                case D => print("matched02")
            }
        case B => print("fail02");
    }
}

main(): Int64 {
    test()
    return 0
}
