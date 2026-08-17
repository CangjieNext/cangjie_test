// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan invalidPattern: Invalid funcTypeStr pattern `(**,**)->*`.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "target",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**,**)->*"
]
public func invalidPattern(args: Array<Any>): Unit {}

public func target(): Unit {}

main() {
    target()
    0
}
