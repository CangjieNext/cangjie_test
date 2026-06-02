/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// (not windows)EXEC: cp -r ./A ./.A
// (not windows)ERRCHECK:  %compiler %cmp_opt %compile_lib_opt ./.A/A.cj -o b.%middle 
// (not windows)ASSERT: scan parse_expected_name

import A.*

main() {
    return test - 1
}
