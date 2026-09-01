/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan has first parameter type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class CA {
    public func foo(x: Int64): Int64 {
        x
    }
}

@ReplaceFuncBody[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
    recursive: false]
public func aspect(wrong: Int64, x: Int64, f: (CA, Int64) -> Int64): Int64 {
    f(CA(), x)
}

main() {
    println(CA().foo(1))
    0
}
