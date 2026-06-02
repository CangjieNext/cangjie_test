// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB999

class CCCC {
    public var xxxx: Int64 = 999
}

enum EXHAUSTIVE_ASSOCIATED_OPTION_LIKE { // optionLike_ref
    A | B(CCCC)
}

func foo(e: EXHAUSTIVE_ASSOCIATED_OPTION_LIKE) {
    match (e) {
        case A => println("AAA")
        case B(cccc) =>
            print("BBB");
            println(cccc.xxxx)
    }
}

main() {
    foo(EXHAUSTIVE_ASSOCIATED_OPTION_LIKE.B(CCCC()))
    return 0
}
