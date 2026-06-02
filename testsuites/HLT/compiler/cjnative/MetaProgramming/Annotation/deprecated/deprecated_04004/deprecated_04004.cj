/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: a.cj
// EXEC:%compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// ERRCHECK: %compiler %cmp_opt a.%middle %f -o %output
// ASSERT: scan sema_deprecated_error

package use

import a.*

@Deprecated[strict: true]
class A {
    var x = foo()
}

main() {
    A()
    return 0
}
