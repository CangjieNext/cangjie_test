/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: %n.plugin.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %n.plugin.cj --output-type=dylib -o libplugin.%dylib_suffix -lstdx.plugin %import-cangjie-stdx
// EXEC-PIPE-1: %compiler --plugin=libplugin.%dylib_suffix %f %import-cangjie-stdx %compile_lib_opt 2>&1 | compare %f

public let a = 1
// ASSERT: scan throw exception test
