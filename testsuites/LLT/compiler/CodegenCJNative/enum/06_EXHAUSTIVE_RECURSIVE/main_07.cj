// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: regex-auto matched

class AAAA {}

enum E<T> {
    A(E<T>) | B
}

func test() {
    var a: E<AAAA> = E<AAAA>.A(E<AAAA>.B)
    match (a) {
        case A(v) => print("matched");
        case B => print("fail");
    }
}

main(): Int64 {
    test()
    return 0
}
