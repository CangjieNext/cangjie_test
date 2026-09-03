/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Aspect declared on `extend Int64` so getFuncOuterDeclaredOrExtendedDef takes the
// ExtendDef + non-CustomType (builtin) branch. Members of builtin extends are
// not treated as externally-linked public functions by collect_aspects.

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan must be public
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

extend Int64 {
    @InsertAtEntry[packageName: "default", className: "Int64", methodName: "aopFoo", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func aspect(): Unit {
        println("#----- aspect -----#")
    }

    public func aopFoo(): Unit {
        println("#----- foo -----#")
    }
}

main() {
    1.aopFoo()
    0
}
