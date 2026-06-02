/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: root
// EXEC:  %compiler %cmp_opt %compile_lib_opt  ./root/B/B.cj -o b.%middle 
// ERRCHECK:  %compiler %cmp_opt %compile_lib_opt b.%middle ./root/A/A.cj -o a.%middle 
// ASSERT: scan sema_invalid_access_control

import root.A.*

main() {
    return aa
}
