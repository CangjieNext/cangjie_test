/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Instance @ReplaceFuncBody whose only explicit parameter is `original`.
// After stripping `this` and the original-function parameter, aspectParams is empty.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- wrap -----#\n#----- original -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class CA {
    @ReplaceFuncBody[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
        recursive: false]
    public func aspect(original: () -> Unit): Unit {
        println("#----- wrap -----#")
        original()
    }

    public func foo(): Unit {
        println("#----- original -----#")
    }
}

main() {
    CA().foo()
    0
}
