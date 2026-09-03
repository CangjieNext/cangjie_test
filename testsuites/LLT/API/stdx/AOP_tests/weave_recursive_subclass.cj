/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// recursive: true weaves the parent className into an overriding subclass method.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- aspect -----#\n#----- CA -----#\n#----- aspect -----#\n#----- CB -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

open class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
        recursive: true, funcTypeStr: "()->Unit"]
    public func aspect(): Unit {
        println("#----- aspect -----#")
    }

    public open func foo(): Unit {
        println("#----- CA -----#")
    }
}

class CB <: CA {
    public func foo(): Unit {
        println("#----- CB -----#")
    }
}

main() {
    CA().foo()
    CB().foo()
    0
}
