/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: checkConstVarName.cj
// EXEC: %compiler checkConstVarName.cj --output-type=dylib -o libplugin.%dylib_suffix -lstdx.plugin %import-cangjie-stdx
// EXEC-PIPE: %compiler --plugin=libplugin.%dylib_suffix %f %compile_lib_opt %import-cangjie-stdx | compare %f

public const ALL_UPPERCASE = 1
// ASSERT: scan check const var name is all uppercase success
