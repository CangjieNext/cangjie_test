/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend<T> Array<T> {
    func test(a: (Array<T>) -> T) {
        var f: Int64 = a(this)
        f
    }
}

main() {
    0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan expected 'Int64', found 'Generics-T'
