// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan printCurrentTimeImpl: Function with AOP annotations must not be generic.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspectCJ.*
import std.time.DateTime

@ReplaceFuncBody[packageName: "default", className: "", methodName: "printCurrentTime", isStatic: false, recursive: false]
public func printCurrentTimeImpl<T>(original: (String) -> String) {
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
