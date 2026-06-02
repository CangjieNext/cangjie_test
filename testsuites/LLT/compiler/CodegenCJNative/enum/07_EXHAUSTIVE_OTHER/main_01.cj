// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan CCCC888999

open class AAAA {
    public var y: UInt64 = 888
}

class CCCC <: AAAA {
    public var x = 999
}

enum EXHAUSTIVE_OTHER {
    A | B | C(CCCC)
}

main() {
    var e = EXHAUSTIVE_OTHER.C(CCCC())
    match (e) {
        case A => println("AAAA")
        case B => println("BBBB")
        case C(c) =>
            print("CCCC");
            print(c.y);
            println(c.x)
    }
    return 0
}
