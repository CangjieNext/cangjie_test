/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: b
// EXEC: %compiler %cmp_opt %compile_lib_opt ./b/b.cj -o b.%middle
// ERRCHECK: %compiler %cmp_opt %f b.%middle -o %output

import b

interface b {
    static func test(a: Int8): Int64 {
        return 2
    }
}

main() {
    if (b.test(1) == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_conflict_with_sub_package
