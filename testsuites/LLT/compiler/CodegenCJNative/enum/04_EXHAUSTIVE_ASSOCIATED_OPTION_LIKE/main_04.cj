// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBBBBB999
// ASSERT: scan BBBBBB888

class CCCC <: ToString {
    public var xxxx: Int64 = 999
    public func toString() {
        return xxxx.toString()
    }
}

enum EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<T> <: ToString where T <: ToString { // optionLike_T
    A | B(T)

    public func toString() {
        match (this) {
            case A => return "AAA"
            case B(t) =>
                print("BBB");
                return t.toString()
        }
    }
}

func foo<T>(e: EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<T>) where T <: ToString {
    match (e) {
        case A => println("AAA")
        case B(tttt) =>
            print("BBB");
            println(tttt)
    }
}

main() {
    foo(
        EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<CCCC>>.B(
            EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<CCCC>.B(CCCC())))
    foo(
        EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<Int64>>.B(
            EXHAUSTIVE_ASSOCIATED_OPTION_LIKE<Int64>.B(888)))
    return 0
}
