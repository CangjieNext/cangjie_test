/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libstdx.collect_aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libstdx.wave_aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan The aspect function printCurrentTimeImpl has different FuncType with the waved.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*
import std.time.DateTime

let g_a = 1
var g_b = true

@InsertAtEntry[packageName: "default", className: "EA", methodName: "printCurrentTime", isStatic: true,
    recursive: false, funcTypeStr: "(std.core.String)->std.core.String"]
public func printCurrentTimeImpl(e: EA, str: String) {
    println("#----- InsertAtEntry: ${str} -----#")
}

public enum EA {
    Case1 | Case2

    public static func printCurrentTime(x: String): String {
        println(x)
        "456"
    }
}

main() {
    println(EA.printCurrentTime("123"))
    0
}
