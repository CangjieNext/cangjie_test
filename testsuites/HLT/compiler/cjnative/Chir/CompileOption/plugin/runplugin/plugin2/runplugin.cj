/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not OHOS) LEVEL: 1
// (CJNATIVE and not OHOS) DEPENDENCE: CMakeLists.txt, ./src
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && cd build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %compiler %cmp_opt %f --plugin=./output/libplugin2.%dylib_suffix -o %output

package a.b.c

public class C1<T> where T <: ToString {}

main() {
    C1<Int64>()
    return 0
}
