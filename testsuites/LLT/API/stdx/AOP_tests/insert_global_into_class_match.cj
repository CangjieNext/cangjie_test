/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Global aspect whose first parameter is the woven instance type (CustomType match).
// Classes are passed as RefType, so a struct is required to hit the CustomType arm.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- aspect -----#\n#----- foo -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public struct CA {
    public func foo(x: String): Unit {
        println("#----- foo -----#")
    }
}

@InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
    recursive: false, funcTypeStr: "(std.core.String)->Unit"]
public func aspect(self: CA, x: String): Unit {
    println("#----- aspect -----#")
}

main() {
    CA().foo("ok")
    0
}
