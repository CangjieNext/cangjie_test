/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility_with_main_hint

protected func temp() {
    return T_a()
}

internal class T_a {}

main() {
    return 0
}
