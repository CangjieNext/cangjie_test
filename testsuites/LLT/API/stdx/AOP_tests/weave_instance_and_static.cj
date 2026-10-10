/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Instance callee uses args[0].ty; static callee uses outerType.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- inst aspect -----#\n#----- inst foo -----#\n#----- static aspect -----#\n#----- static foo -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func instAspect(): Unit {
        println("#----- inst aspect -----#")
    }

    public func foo(): Unit {
        println("#----- inst foo -----#")
    }

    @InsertAtEntry[packageName: "default", className: "CA", methodName: "sfoo", isStatic: true,
        recursive: false, funcTypeStr: "()->Unit"]
    public static func staticAspect(): Unit {
        println("#----- static aspect -----#")
    }

    public static func sfoo(): Unit {
        println("#----- static foo -----#")
    }
}

main() {
    CA().foo()
    CA.sfoo()
    0
}
