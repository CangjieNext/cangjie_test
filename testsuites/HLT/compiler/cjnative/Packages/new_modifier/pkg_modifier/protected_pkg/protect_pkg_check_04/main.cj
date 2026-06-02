/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A,B
// EXEC:  %compiler %cmp_opt %compile_lib_opt  ./B/b/b.cj -o b.%middle 
// ERRCHECK:  %compiler %cmp_opt %compile_lib_opt  ./A/a/a.cj -o a.%middle
// ASSERT: scan package_accessibility

internal import A.a.*

main() {
    return temp_a.temp_b - 1
}
