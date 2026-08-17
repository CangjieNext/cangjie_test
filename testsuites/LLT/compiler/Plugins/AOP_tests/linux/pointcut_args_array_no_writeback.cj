// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan advice.changed\ntarget.value=7\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "valueTarget",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(Int64)->Unit"
]
public func mutateAdviceArray(args: Array<Any>): Unit {
    args[0] = 99
    println("advice.changed")
}

public func valueTarget(value: Int64): Unit {
    println("target.value=${value}")
}

main() {
    valueTarget(7)
    0
}
