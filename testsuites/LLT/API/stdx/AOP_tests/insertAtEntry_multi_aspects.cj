/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan a1\nw1\na2\nw2\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

let g_a = 1

@InsertAtEntry[packageName: "default", className: "", methodName: "woven1", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func aspect1(): Unit {
    println("a1")
}

@InsertAtEntry[packageName: "default", className: "", methodName: "woven2", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func aspect2(): Unit {
    println("a2")
}

public func woven1(): Unit {
    println("w1")
}

public func woven2(): Unit {
    println("w2")
}

main() {
    woven1()
    woven2()
    0
}
