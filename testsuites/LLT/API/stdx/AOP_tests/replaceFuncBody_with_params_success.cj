/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Successful @ReplaceFuncBody whose aspect has extra parameters besides `original`.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan wrap\nwoven\n7\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@ReplaceFuncBody[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false]
public func wrap(x: Int64, original: (Int64) -> Int64): Int64 {
    println("wrap")
    original(x)
}

public func woven(x: Int64): Int64 {
    println("woven")
    x
}

main() {
    println(woven(7))
    0
}
