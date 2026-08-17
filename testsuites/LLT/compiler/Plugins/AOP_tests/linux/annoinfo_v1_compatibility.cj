// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output.collect %collect_aspects_plugin && sed -i '1d;10d' default-default.annoinfo && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin && %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan before-v1\ntarget-v1
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "targetV1",
    isStatic: false,
    recursive: false,
    funcTypeStr: "()->std.core.Unit"
]
public func beforeV1(): Unit {
    println("before-v1")
}

public func targetV1(): Unit {
    println("target-v1")
}

main() {
    targetV1()
    0
}
