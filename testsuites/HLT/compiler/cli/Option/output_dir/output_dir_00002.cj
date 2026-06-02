/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: rm -rf dir;mkdir dir
// (Windows) EXEC-PIPE: mkdir dir
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt %f --output-dir ./dir
// EXEC-PIPE: %ls dir/*%n.%middle

func test() {
    return 0
}
