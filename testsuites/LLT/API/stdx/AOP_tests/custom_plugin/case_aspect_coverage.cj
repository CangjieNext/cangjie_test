/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: plugin_aspect_coverage.cj
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %compile_shared_lib_opt plugin_aspect_coverage.cj -o libplugin_aspect_coverage.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt -Woff unused %f -o %output --plugin=./libplugin_aspect_coverage.%dylib_suffix 2>&1 | compare %f
// ASSERT: scan output info: InsertAtEntry\n
// ASSERT: scan mapArrayTo empty: 0\n
// ASSERT: scan mapArrayTo nonempty: 3\n
// ASSERT: scan hit global outer: true\n
// ASSERT: scan hit custom outer: true\n
// ASSERT: scan hit other outer: true\n
// ASSERT: scan aspect coverage plugin done\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public class CA {
    public func foo(): Unit {
        ()
    }
}

extend Int64 {
    public func aopFoo(): Unit {
        ()
    }
}

extend String {
    public func aopBar(): Unit {
        ()
    }
}

main() {
    CA().foo()
    1.aopFoo()
    "s".aopBar()
    0
}
