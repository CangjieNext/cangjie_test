// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan printCurrentTimeImpl: Return type of the function annotated with @ReplaceFuncBody must be the same as the return type of the function it is woven into.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*
import std.time.DateTime

@ReplaceFuncBody[packageName: "default", className: "", methodName: "printCurrentTime", isStatic: false, recursive: false]
public func printCurrentTimeImpl(original: (String) -> String) {
    println("#----- start -----#")
    println(original("abc"))
    println("#----- end -----#")
    1
}

public func printCurrentTime(x: String): String {
    println(x)
    "456"
}

main() {
    println(printCurrentTime("123"))
    0
}
