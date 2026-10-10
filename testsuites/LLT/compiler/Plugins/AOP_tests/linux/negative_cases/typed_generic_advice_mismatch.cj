// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan Aspect function 'captureWrongArray' has parameter types '(std.core.Array<std.core.String>)', expected '(Array<Int64>)'.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "default", className: "", methodName: "target",
    isStatic: false, recursive: false, funcTypeStr: "(Array<Int64>)->Unit"
]
public func captureWrongArray(values: Array<String>): Unit {}

public func target(values: Array<Int64>): Unit {}
main() { target([1, 2]); 0 }
