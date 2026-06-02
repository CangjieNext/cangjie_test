/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

const func test1() {
    func test2() {
        const a = 1
        return a
    }
    return test2() - 1
}

main() {
    return test1()
}
// ASSERT: scan sema_expect_const
