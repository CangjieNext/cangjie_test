/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(host_win | target_ohos)) DEPENDENCE: CMakeLists.txt, ./src
// (!(host_win | target_ohos)) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && cd build && cmake .. && make clean && make && make install
// (!(host_win | target_ohos)) EXEC: %compiler %cmp_opt %f %static_libs --plugin=./output/libmyplugin1.%host_dylib_suffix -o %output

public class C1<T> where T <: ToString {}

main() {
    C1<Int64>()
    return 0
}
