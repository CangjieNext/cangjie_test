/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan start\nwovenFunction1\nwovenFunction2\nend
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspectCJ.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "", methodName: "wovenFunction1", isStatic: false,
    recursive: false]
public func globalFunction0(p0: (Int32) -> Int64): Int64 {
    println("annotatedFunction")
    p0(1)
    114514
}

public func wovenFunction1(p0: Int64): Int64 {
    println("wovenFunction1")
    666
}

public func wovenFunction2(p0: Int64): Int64 {
    println("wovenFunction2")
    666
}

main(): Unit {
    println("start")
    wovenFunction1(123)
    wovenFunction2(123)
    println("end")
}
