// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

main(): Int64 {
    if (false) {
        return 1
        1
    } else {
        return 0
        2
    }
}
