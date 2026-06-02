/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src 
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle

import pkgs.*

main(): Int64 {
    if (Son.a == 1) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_non_abstract_class_cannot_be_sealed
