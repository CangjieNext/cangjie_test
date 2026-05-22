// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libstdx.collect_aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libstdx.wave_aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan annotatedFunction: The first parameter of the function annotated with @InsertAtEntry/@InsertAtExit must be the same as the type indicated by packageName and className.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

public class AnnotatedClass {
    @InsertAtEntry[packageName: "AOP_demo1", className: "AnnotatedClass", methodName: "wovenFunction", isStatic: false, recursive: false, funcTypeStr: "(std.core.String)->std.core.String"]
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
