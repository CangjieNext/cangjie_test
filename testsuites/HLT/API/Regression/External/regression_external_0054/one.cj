/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./src
// EXEC: %compiler %cmp_opt %pkg_opt src/foo %compile_lib_opt -o foo.%middle
// EXEC: %compiler %cmp_opt %pkg_opt src foo.%middle
