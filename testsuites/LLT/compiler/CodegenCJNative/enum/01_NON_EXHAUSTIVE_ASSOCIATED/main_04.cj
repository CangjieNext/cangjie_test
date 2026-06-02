// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB999
// ASSERT: scan BBB888

class CCCC <: ToString {
    public var xxxx: Int64 = 999
    public func toString() {
        return xxxx.toString()
    }
}

enum NON_EXHAUSTIVE_ASSOCIATED<T> where T <: ToString { // optionLike_T
    A | B(T) | ...
}

func foo<T>(e: NON_EXHAUSTIVE_ASSOCIATED<T>) where T <: ToString {
    match (e) {
        case A => println("AAA")
        case B(cccc) =>
            print("BBB");
            println(cccc)
        case _ => println("unknown")
    }
}

main() {
    foo(NON_EXHAUSTIVE_ASSOCIATED<CCCC>.B(CCCC()))
    foo(NON_EXHAUSTIVE_ASSOCIATED<Int64>.B(888))
    return 0
}
