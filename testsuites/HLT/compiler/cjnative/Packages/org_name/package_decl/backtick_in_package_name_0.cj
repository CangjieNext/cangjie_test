/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DESCRIPTION: having backtick in organization name.
// EXEC-PIPE-1: %compiler %cmp_opt %compile_dylib_opt %f 2>&1 | compare %f
// ASSERT: scan parse_package_name_has_backtick

package `org`::pkg
