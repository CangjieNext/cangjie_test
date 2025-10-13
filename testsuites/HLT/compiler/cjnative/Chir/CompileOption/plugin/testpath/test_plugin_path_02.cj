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
// (CJNATIVE and not OHOS) EXEC: %compiler %cmp_opt %f --plugin=%pwd/output/libmyplugin1.%dylib_suffix -o %output
// (CJNATIVE and not OHOS) RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main() {
    let map = HashMap<Int64, String>([(1, "1")])
    return 0
}
