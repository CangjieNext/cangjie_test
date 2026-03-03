/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (!(host_win | target_ohos)) DEPENDENCE: ../runplugin/plugin1, ../runplugin/plugin2
// (!(host_win | target_ohos)) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin1/build && cd plugin1/build && cmake .. && make clean && make && make install
// (!(host_win | target_ohos)) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin2/build && cd plugin2/build && cmake .. && make clean && make && make install
// (!(host_win | target_ohos)) EXEC-PIPE: %compiler %cmp_opt %f --plugin=./plugin1/output/libplugin1.%host_dylib_suffix --plugin=./plugin2/output/libplugin2.%host_dylib_suffix --plugin=./plugin1/output/libplugin1.%host_dylib_suffix -o %output | compare %f
// (!(host_win | target_ohos)) ASSERT: scan-2 Found 1 Packages
// (!(host_win | target_ohos)) ASSERT: scan Found 1 Funcs

/*
    description：加载不同功能的合法插件
 */

package a.b.c

public class C1<T> where T <: ToString {}

main() {
    C1<Int64>()
    return 0
}
