/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// className does not match the extend-builtin outer type, but recursive is true,
// so outerTypeNameMeets walks BuiltinType super types and then returns false.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- foo -----#\n
// ASSERT: scan-not #----- aspect -----#
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "default", className: "NotASuper", methodName: "aopFoo", isStatic: false,
    recursive: true, funcTypeStr: "()->Unit"]
public func aspect(): Unit {
    println("#----- aspect -----#")
}

extend Int64 {
    public func aopFoo(): Unit {
        println("#----- foo -----#")
    }
}

main() {
    1.aopFoo()
    0
}
