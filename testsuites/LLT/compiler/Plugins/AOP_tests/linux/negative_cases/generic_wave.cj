// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan annotatedFunction: Function with AOP annotations must not be generic.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspectCJ.*

public class AnnotatedClass<T> {
    @InsertAtEntry[packageName: "AOP_demo1", className: "WovenClass", methodName: "wovenFunction", isStatic: true, funcTypeStr: "()->Unit", recursive: false]
    public static func annotatedFunction(): Unit {
        println("annotatedFunction")
        ()
    }
}

public class WovenClass {
    public static func wovenFunction<T>(): Unit {
        println("wovenFunction")
        ()
    }
}

main(): Unit {
    println("start")
    WovenClass.wovenFunction<Int64>()
    println("end")
}
