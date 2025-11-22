/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not OHOS) LEVEL: 2
// (CJNATIVE and not OHOS) DEPENDENCE: ../runplugin/plugin1, ../runplugin/plugin3
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin1/build && cd plugin1/build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin3/build && cd plugin3/build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC-PIPE-1: %compiler %cmp_opt %f --plugin=./plugin1/output/libplugin1.%dylib_suffix --plugin=./plugin3/output/libplugin3.%dylib_suffix -o %output 2>&1 | compare %f
// (CJNATIVE and not OHOS) ASSERT: scan not_a_valid_plugin

/*
    description：含有非法插件会导致直接编译报错
 */

package a.b.c

public class C1<T> where T <: ToString {}

main() {
    C1<Int64>()
    return 0
}
