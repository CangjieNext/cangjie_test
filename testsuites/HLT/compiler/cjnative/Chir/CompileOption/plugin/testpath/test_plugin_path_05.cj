/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(host_win | target_ohos)) DEPENDENCE: CMakeLists.txt, ./src
// (!(host_win | target_ohos)) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && %mkdir "仓颉" && cd build && cmake .. && make clean && make && make install
// (!(host_win | target_ohos)) EXEC: %mv ./output/libmyplugin1.%host_dylib_suffix ./仓颉
// (!(host_win | target_ohos)) EXEC-PIPE: %compiler %cmp_opt %f --plugin=./仓颉/libmyplugin1.%host_dylib_suffix -o %output | compare %f
// (!(host_win | target_ohos)) ASSERT: regex Found [0-9]+ funcs

import std.collection.*

main() {
    let map = HashMap<Int64, String>([(1, "1")])
    return 0
}
