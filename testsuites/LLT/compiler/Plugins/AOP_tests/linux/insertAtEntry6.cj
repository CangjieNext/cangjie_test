// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
/* SCAN
start
annotatedFunction
wovenFunction
end
*/

package AOP_demo1

import stdx.aspectCJ.*

public enum AnnotatedClass {
    | A

    @InsertAtEntry[packageName: "AOP_demo1", className: "WovenClass", methodName: "wovenFunction", isStatic: true, funcTypeStr: "()->Unit", recursive: true]
    public static func annotatedFunction(): Unit {
        println("annotatedFunction")
        ()
    }
}

public class WovenClass {
    public static func wovenFunction(): Unit {
        println("wovenFunction")
        ()
    }
}

main(): Unit {
    println("start")
    WovenClass.wovenFunction()
    println("end")
}
