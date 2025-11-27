/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %touch libplugin.%dylib_suffix
// EXEC-PIPE-1: %compiler --plugin=libplugin.%dylib_suffix %f %import-cangjie-stdx 2>&1 | compare %f

public const ALL_UPPERCASE = 1
// (Linux)ASSERT: scan libplugin.so' is not a valid compiler plugin to be loaded or executed
// (MacOS)ASSERT: scan libplugin.dylib' is not a valid compiler plugin to be loaded or executed
// (Windows)ASSERT: scan libplugin.dll' is not a valid compiler plugin to be loaded or executed
