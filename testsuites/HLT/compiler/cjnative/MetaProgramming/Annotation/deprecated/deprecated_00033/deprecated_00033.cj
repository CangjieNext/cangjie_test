/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: a.cj b.cj
// EXEC:%compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// ERRCHECK:%compiler %cmp_opt %compile_lib_opt b.cj -o b.%middle
// ASSERT: scan parse_unexpected_anno_on

package deprecated_00033

import b

class A {
    var x = f()
}

main() {
    return 1
}
