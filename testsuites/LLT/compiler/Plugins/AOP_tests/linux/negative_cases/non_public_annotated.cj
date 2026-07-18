// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan printCurrentTimeImpl: Function with AOP annotations must be public.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*
import std.time.DateTime

@InsertAtEntry[packageName: "default", className: "", methodName: "printCurrentTime", isStatic: false, funcTypeStr: "(std.core.String)->std.core.String", recursive: false]
func printCurrentTimeImpl() {
    println("#----- InsertAtEntry -----#")
}

public func printCurrentTime(x: String): String {
    println(x)
    "456"
}

main() {
    println(printCurrentTime("123"))
    0
}
