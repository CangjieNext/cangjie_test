/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// ERRCHECK:  %compiler %cmp_opt %compile_lib_opt ./A/A1/a/a.cj -o b.%middle
// ASSERT: scan package_search_error

import A.A1.a.*

main() {
    return temp_test - 1
}
