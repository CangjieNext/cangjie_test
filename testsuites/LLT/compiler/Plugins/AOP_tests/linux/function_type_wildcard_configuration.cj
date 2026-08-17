// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan args=1\nhandleName\nargs=2\nhandleCode\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default",
    className: "*",
    methodName: "handle*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**,std.core.String)->*"
]
public func captureMatchingArgs(args: Array<Any>) {
    println("args=${args.size}")
}

public func handleName(name: String): Unit {
    println("handleName")
}

public func handleCode(code: Int64, name: String): Int64 {
    println("handleCode")
    code
}

main() {
    handleName("cj")
    handleCode(42, "cj")
    0
}
