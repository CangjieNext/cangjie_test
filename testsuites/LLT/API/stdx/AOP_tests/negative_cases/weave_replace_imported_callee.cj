/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Weave-only: ReplaceFuncBody whose aspect mangled name is missing in-package,
// so getCallee creates an imported stub and sets returnType from the target.
// Linking fails on the missing symbol; that still exercises the weave path.

// EXEC-PIPE-1: printf '%s\n' 'default' 'dummyInit' 'ReplaceFuncBody' 'other' 'missingAspect' '1' 'false' 'false' 'default' '' 'woven' '()->Unit' 'false' 'false' > default-default.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin 2>&1 | compare %f
// (Windows) ASSERT: scan undefined symbol: missingAspect
// (Mac) ASSERT: scan undefined symbol: _missingAspect
// (Linux) ASSERT: regex undefined reference to .*missingAspect.*
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func woven(): Unit {
    println("woven")
}

main() {
    woven()
    0
}
