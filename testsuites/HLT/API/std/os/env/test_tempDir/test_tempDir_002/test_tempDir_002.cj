/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS and not Windows or OHOS) RUN-EXEC-PIPE: unset TMPDIR TEMP TEMPDIR && %export TMP=test_tmp && mkdir -p test_tmp && %run %run_opt %output %run_args | compare %f
// (Windows and not OHOS) RUN-EXEC-PIPE: set TMPDIR=&&set TEMP=&&set TEMPDIR=&& %export TMP=test_tmp&& mkdir -p test_tmp && %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass

import std.process.*
import std.fs.*

main(): Int64 {
    var path: Path = Process.current.tempDirectory

    if (FileInfo(path).path == canonicalize(Path("./test_tmp"))) {
        print("pass")
    }

    return 0
}
