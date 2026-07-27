/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: plugin_func_count.cj
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.chir -lstdx.plugin.manager -lstdx --import-path $CANGJIE_STDX_PATH %compile_shared_lib_opt plugin_func_count.cj -o libplugin_func_count.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH && %compiler %cmp_opt -Woff unused %f -o %output --plugin=./libplugin_func_count.%dylib_suffix 2>&1 | compare %f
// ASSERT: scan function count: 3\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T> {
    func foo(x: T): Unit
}

class CA <: I<Bool> {
    public func foo(x: Bool): Unit {
        println("foo")
    }
}

main() {
    0
}
