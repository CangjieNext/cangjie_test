// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

main(): Int64 {
    let var_1673084014612_1568: (Int64, Option<Bool>, Unit) = (Int64(UInt16(16)), Option<Bool>.Some(true), ());
    var_1673084014612_1568[1];

    return 0;
}