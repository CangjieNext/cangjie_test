/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.aspectCJ --import-path $CANGJIE_STDX_PATH %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libcollect-aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libwave-aspects.%dylib_suffix
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan #----- SA: ok -----#\n#1#\n#----- SA: ok -----#\n#2#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspectCJ.*
import std.time.DateTime

open class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
        funcTypeStr: "(std.core.String)->Unit", recursive: true]
    public func goo(x: String) {
        println("#----- SA: ${x} -----#")
    }

    public open func foo(y: String) {
        println("#1#")
    }
}

class CB <: CA {
    public func foo(y: String) {
        println("#2#")
    }
}

main() {
    CA().foo("ok")
    CB().foo("ok")
    0
}
