// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- SA: ok -----#\n#1#\n#----- SA: ok -----#\n#2#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*
import std.time.DateTime

open class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false, recursive: true, funcTypeStr: "(std.core.String)->Unit"]
    public func goo(x: String) {
        println("#----- SA: ${x} -----#")
    }

    public open func foo(y: String) {
        println("#1#")
    }
}

class CB <: CA {
    public func foo(y: String) {
        println("#2#")
    }
}

main() {
    CA().foo("ok")
    CB().foo("ok")
    0
}
