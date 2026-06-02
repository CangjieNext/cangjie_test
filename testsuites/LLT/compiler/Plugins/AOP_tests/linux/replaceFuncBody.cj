// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix
// (CJNATIVE and Linux)RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan #----- start -----#\nabc\n456\n#----- end -----#\ndef
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspectCJ.*
import std.time.DateTime

@ReplaceFuncBody[packageName: "default", className: "", methodName: "printCurrentTime", isStatic: false, recursive: false]
public func printCurrentTimeImpl(original: (String) -> String) {
    println("#----- start -----#")
    println(original("abc"))
    println("#----- end -----#")
    "def"
}

public func printCurrentTime(x: String): String {
    println(x)
    "456"
}

main() {
    println(printCurrentTime("123"))
    0
}
