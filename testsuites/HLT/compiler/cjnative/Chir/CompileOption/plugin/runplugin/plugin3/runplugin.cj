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
// (!target_ohos) EXEC-PIPE-1: %compiler %cmp_opt %f --plugin=./output/libplugin3.%host_dylib_suffix -o %output 2>&1 | compare %f
// (!target_ohos) ASSERT: scan 

package a.b.c

public class C1<T> where T <: ToString {}

main() {
    C1<Int64>()
    return 0
}
