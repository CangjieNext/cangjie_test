/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
/* SCAN
left
#----- InsertAtExit -----#
right
#----- InsertAtExit -----#
*/
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtExit[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false, funcTypeStr: "(Bool)->Unit"]
public func aspect(flag: Bool): Unit {
    println("#----- InsertAtExit -----#")
}

public func woven(flag: Bool): Unit {
    if (flag) {
        println("left")
        return
    }
    println("right")
}

main() {
    woven(true)
    woven(false)
    0
}
