/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- static aspect -----#\n#----- static foo -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: true,
        recursive: false, funcTypeStr: "(std.core.String)->Unit"]
    public static func aspect(x: String): Unit {
        println("#----- static aspect -----#")
    }

    public static func foo(y: String): Unit {
        println("#----- static foo -----#")
    }
}

main() {
    CA.foo("ok")
    0
}
