/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../hide.cj upstream.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt hide.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt -L. -lohos.labels upstream.cj
// EXEC-PIPE-1: %compiler %cmp_opt -L. -lohos.upstream -lohos.labels %f -o %output 2>&1 | compare %f
// ASSERT: scan undeclared identifier 'A'

import ohos.upstream.*
import ohos.upstream

class D<T> {
    func xxx<R>(): Unit {
        1 as A
    }
}

main() {
}
