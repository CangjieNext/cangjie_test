// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan before\nprintAlpha\nbefore\nprintBeta\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "def*",
    className: "*",
    methodName: "print*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "()->std.core.Unit"
]
public func beforePrint() {
    println("before")
}

public func printAlpha(): Unit {
    println("printAlpha")
}

public func printBeta(): Unit {
    println("printBeta")
}

main() {
    printAlpha()
    printBeta()
    0
}
