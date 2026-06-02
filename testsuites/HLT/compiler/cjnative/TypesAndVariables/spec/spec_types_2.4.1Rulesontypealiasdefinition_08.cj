/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package A

class ClassWithLongNameB {}
/* error: classB can not be declared with modifier 'public', as 'ClassWithLongNameB' is (by default) declared with modifier 'internal' */
public type classB = ClassWithLongNameB

main() {
    return 0
}
// ASSERT: scan sema_typealias_external_refer_internal
