/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not OHOS) LEVEL: 2
// (CJNATIVE and not OHOS) DEPENDENCE: CMakeLists.txt, ./src
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && %mkdir "仓颉" && cd build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %mv ./output/libmyplugin1.%dylib_suffix ./仓颉
// (CJNATIVE and not OHOS) EXEC-PIPE: %compiler %cmp_opt %f --plugin=./仓颉/libmyplugin1.%dylib_suffix -o %output | compare %f
// (CJNATIVE and not OHOS) ASSERT: regex Found [0-9]+ funcs

import std.collection.*

main() {
    let map = HashMap<Int64, String>([(1, "1")])
    return 0
}
