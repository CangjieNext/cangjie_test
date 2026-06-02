// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan annotatedFunction: For any function annotated with @ReplaceFuncBody, if it is intended to be woven into an instance member function, and its last parameter is of function type, the first parameter of this function type must be the same as the type indicated by packageName and className.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspectCJ.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "xxx", methodName: "wovenFunction", isStatic: false, recursive: false]
public func annotatedFunction(p0: () -> Unit): Unit {
    println("annotatedFunction")
    ()
}

public func wovenFunction(): Unit {
    println("wovenFunction")
    ()
}

main(): Unit {
    println("start")
    wovenFunction()
    println("end")
}
