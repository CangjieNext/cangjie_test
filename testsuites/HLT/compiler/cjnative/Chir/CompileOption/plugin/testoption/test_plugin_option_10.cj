/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not OHOS) LEVEL: 2
// (CJNATIVE and not OHOS) DEPENDENCE: CMakeLists.txt, ./src, const.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %cmp_opt %compile_dylib_opt const.cj -o libsourcecode.%dylib_suffix
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && cd build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %compiler %cmp_opt %f -L. -lsourcecode %enableConstPropagation --plugin=./output/libmyplugin1.%dylib_suffix -o %output

import sourcecode.*

main() {
    return a
}
