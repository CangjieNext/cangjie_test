/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan test out
// ASSERT: scan-not test err

internal import std.env.*

/**
 * 测试用例说明
 * 这是一个区分 stdout 和 stderr 的测试用例，
 *    用于监视 stderr 是否和 stdout 输出到一个流中
 */
main() {
    let out = getStdOut()
    let err = getStdErr()
    out.writeln("test out")
    err.writeln("test err")
}
