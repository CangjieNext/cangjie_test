/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output --plugin=$CANGJIE_STDX_PATH/libstdx.collect_aspects.%dylib_suffix --plugin=$CANGJIE_STDX_PATH/libstdx.wave_aspects.%dylib_suffix
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan #----- SA: ok -----#\n#----- SA: ok -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*
import std.time.DateTime

struct SA {
    @InsertAtEntry[packageName: "default", className: "SA", methodName: "foo", isStatic: false,
        recursive: false, funcTypeStr: "(std.core.String)->Unit"]
    @InsertAtEntry[packageName: "default", className: "SA", methodName: "foo", isStatic: false,
        recursive: false, funcTypeStr: "(std.core.String)->Unit"]
    public func goo(x: String) {
        println("#----- SA: ${x} -----#")
    }

    public func foo(y: String) {}
}

main() {
    SA().foo("ok")
    0
}
