/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE: %export TMP=test_tmp&& %export TMPDIR=test_tmpdir&& %export TEMP=test_temp&& %export TEMPDIR=test_tempdir&& mkdir -p test_tmpdir test_temp test_tempdir && %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass

import std.process.*
import std.fs.*

main(): Int64 {
    var path: Path = Process.current.tempDirectory

    if (FileInfo(path).path == canonicalize(Path("./test_tmpdir"))) {
        print("pass")
    }

    return 0
}
