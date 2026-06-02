/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: CMakeLists.txt, ./src
// (host_win & !target_ohos) EXEC: set plugin_lsp_suffix=dll.a && %mkdir build && cd build && cmake .. && make clean && make && make install
// (host_win & !target_ohos) EXEC-PIPE: %compiler %cmp_opt %f --plugin=.\output\libmyplugin1.dll -o %output | compare %f
// (host_win & !target_ohos) ASSERT: regex Found [0-9]+ funcs

import std.collection.*

main() {
    let map = HashMap<Int64, String>([(1, "1")])
    return 0
}
