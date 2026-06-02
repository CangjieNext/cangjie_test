/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS and not Windows) EXEC-PIPE: %compiler %cmp_opt %f -o %output
// (not iOS and not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan-not Exception

import std.posix.*

foreign func printf(fmt: CString, ...): Int32

unsafe main() {
    var fd = `open`("/dev/abc", O_RDONLY)
    ttyname(fd)
    close(fd)
    return 0
}
