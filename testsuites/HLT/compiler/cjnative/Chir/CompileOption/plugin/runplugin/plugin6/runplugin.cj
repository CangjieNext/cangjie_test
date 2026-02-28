/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (!target_ohos) DEPENDENCE: CMakeLists.txt, ./src
// (!target_ohos) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && cd build && cmake .. && make clean && make && make install
// (!target_ohos) EXEC-PIPE-1: %compiler %cmp_opt %f --plugin=./output/libplugin6.%host_dylib_suffix -o %output 2>&1 | compare %f
// (!target_ohos) ASSERT: scan not_a_valid_plugin

main() {
    return 0
}
