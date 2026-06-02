/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility

protected class AA<T> where T <: BB<Int64> {
    func test() {
        return 1
    }
}

internal class BB<T> {}

main() {
    var a = AA<BB<Int64>>()
    return a.test() - 1
}
