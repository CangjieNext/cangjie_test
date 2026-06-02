/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: B
// EXEC:  %compiler %cmp_opt %compile_lib_opt ./B/A/A.cj -o a.%middle
// ERRCHECK:  %compiler %cmp_opt %compile_lib_opt a.%middle ./B/B.cj -o b.%middle
// ASSERT: scan package_root_package_should_be_public
import A.NA
import A.NA

main() {
    var res = A_a(1).a + A_a(1).a - 2
    return res
}
