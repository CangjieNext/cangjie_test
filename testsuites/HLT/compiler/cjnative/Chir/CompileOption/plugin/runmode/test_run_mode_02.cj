/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not OHOS) LEVEL: 2
// (CJNATIVE and not OHOS) DEPENDENCE: ../runplugin/plugin1, ../runplugin/plugin2
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin1/build && cd plugin1/build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir plugin2/build && cd plugin2/build && cmake .. && make clean && make && make install
// (CJNATIVE and not OHOS) EXEC: %mv ./plugin1/output/libplugin1.%dylib_suffix ./
// (CJNATIVE and not OHOS) EXEC: %mv ./plugin2/output/libplugin2.%dylib_suffix ./
// (CJNATIVE and not OHOS) EXEC-PIPE: %compiler %cmp_opt %f --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin1.%dylib_suffix --plugin=libplugin2.%dylib_suffix --plugin=libplugin1.%dylib_suffix -o %output | compare %f
// (CJNATIVE and not OHOS) ASSERT: scan-19 Found 1 Packages
// (CJNATIVE and not OHOS) ASSERT: scan Found 1 Funcs

/*
    description：校验加载的插件数量
 */

main() {
    var a = 0
    return a
}
