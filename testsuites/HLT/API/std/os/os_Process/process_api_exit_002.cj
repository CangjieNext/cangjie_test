/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC-255: %run %run_opt %output %run_args

import std.process.*

main() {
    Process.current.exit(-1)
    return 0
}
