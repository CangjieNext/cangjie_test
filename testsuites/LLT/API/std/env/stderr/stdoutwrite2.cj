/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 测试cdefg

internal import std.env.*

main() {
    getStdErr().write("测试")
    var array: Array<UInt8> = [99, 100, 101, 102, 103]
    getStdErr().write(String.fromUtf8(array))
    return 0
}
