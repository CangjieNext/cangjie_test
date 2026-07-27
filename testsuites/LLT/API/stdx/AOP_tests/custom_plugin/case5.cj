/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: plugin_to_string_dump.cj
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.chir -lstdx.plugin.manager -lstdx --import-path $CANGJIE_STDX_PATH %compile_shared_lib_opt plugin_to_string_dump.cj -o libplugin_to_string_dump.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH && %compiler %cmp_opt %enableO2 -Woff unused %f -o %output --plugin=./libplugin_to_string_dump.%dylib_suffix 2>&1 | compare %f
// ASSERT: scan has genericDecl: true\n
// ASSERT: scan toString dump ok\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// to_string_utils：-O2 + 泛型全局函数 → Function.genericDecl 经插件 pkg.toString() 覆盖

func id<T>(x: T): T {
    x
}

main() {
    println(id(1) + id(2))
    0
}
