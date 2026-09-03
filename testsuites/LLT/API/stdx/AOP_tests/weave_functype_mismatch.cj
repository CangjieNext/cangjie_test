/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Collect matches funcTypeStr against the aspect. Weave compares it to the real
// target and skips weaving when the types differ.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan body\n
// ASSERT: scan-not #----- skipped -----#
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false, funcTypeStr: "(std.core.String)->Unit"]
public func aspect(x: String): Unit {
    println("#----- skipped -----#")
}

public func woven(x: Int64): Unit {
    println("body")
}

main() {
    woven(1)
    0
}
