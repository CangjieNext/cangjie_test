/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan Don't weave an instance method into another instance method with different `this` type.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class CA {
    @InsertAtEntry[packageName: "default", className: "CB", methodName: "foo", isStatic: false,
        recursive: false, funcTypeStr: "(std.core.String)->Unit"]
    public func aspect(x: String): Unit {
        println("aspect: ${x}")
    }
}

public class CB {
    public func foo(y: String): Unit {
        println("foo: ${y}")
    }
}

main() {
    CB().foo("ok")
    0
}
