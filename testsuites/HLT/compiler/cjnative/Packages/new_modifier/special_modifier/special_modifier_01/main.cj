/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt ./A/a1/a1.cj -o b.%middle 
// ERRCHECK:  %compiler %cmp_opt b.%middle   main.cj -o %output
// ASSERT: scan package_search_error

import A.*

main() {
    return test - 1
}
