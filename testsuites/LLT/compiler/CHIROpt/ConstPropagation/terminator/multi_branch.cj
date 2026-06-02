// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableConstPropagation %enableO2 %debugCHIROpt %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan [ConstPropagation] The terminator MultiBranch at [14,5] has been optimised

func foo() {
    var x = 34
    match (x) {
        case 1 => println("red")
        case 2 => println("blue")
        case _ => println("green")
    }
}

main() {
    0
}
