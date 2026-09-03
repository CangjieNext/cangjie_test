/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Weave-only: matching filename with unparsable contents hits readAnnoInfo's catch.
// A second file whose suffix is not this package is skipped (results[1] mismatch).

// EXEC-PIPE-0: printf '%s\n' 'default' 'dummyInit' 'InsertAtEntry' 'default' 'dummyAspect' 'not-a-number' 'false' 'false' 'default' '' 'woven' '()->Unit' 'false' 'false' > default-default.annoinfo && printf 'skip\n' > foo-bar.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan woven\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func woven(): Unit {
    println("woven")
}

main() {
    woven()
    0
}
