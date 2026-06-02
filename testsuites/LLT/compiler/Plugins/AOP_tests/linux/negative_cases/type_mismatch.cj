// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan annotatedFunction: Don't wave a method into another instance method with different `this` type.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspectCJ.*

public class AnnotatedClass {
    @InsertAtEntry[packageName: "AOP_demo1", className: "AnnotatedClass", methodName: "wovenFunction", isStatic: false, funcTypeStr: "(std.core.String)->std.core.String", recursive: false]
    public static func annotatedFunction(parameter_0: String, a: String): Unit {
        println("annotatedFunction")
    }

    public func wovenFunction(parameter_0: String): String {
        println("wovenFunction")
        "hello"
    }
}

main(): Unit {
    AnnotatedClass().wovenFunction("hello")
}
