// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableConstPropagation %debugCHIROpt %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan [ConstPropagation] The terminator TypeCastWithException at [16,9] has been optimised

let gv: Int16 = 127

func foo() {
    try {
        Int8(gv)
    } catch (_) {
        Int8(16)
    }
}

main() {
    0
}
