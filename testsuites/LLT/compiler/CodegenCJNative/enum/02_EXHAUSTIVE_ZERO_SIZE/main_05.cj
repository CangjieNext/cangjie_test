// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan okkkEXHAUSTIVE_ZERO_SIZE.A

enum EXHAUSTIVE_ZERO_SIZE <: ToString {
    A

    public func toString() {
        match (this) {
            case A => return "EXHAUSTIVE_ZERO_SIZE.A"
        }
    }
}

main() {
    var tuple = (Option<EXHAUSTIVE_ZERO_SIZE>.Some(EXHAUSTIVE_ZERO_SIZE.A), true)
    match (tuple[0]) {
        case Some(e) => println("okkk${e}")
        case None => println("error")
    }
    return 0
}
