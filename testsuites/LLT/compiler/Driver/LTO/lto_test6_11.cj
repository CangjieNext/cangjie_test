// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan INFO INFO 打印出来！

internal import std.console.*
internal import stdx.log.*
internal import stdx.logger.*

main(): Int64 {
    let logger: SimpleLogger = SimpleLogger(Console.stdOut)
    logger.log(LogLevel.INFO, "INFO 打印出来！")
    return 0
}
