/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public func test(
    @When[debug] a !: Int64 = 1,
    @When[!debug] a !: Int64 = 0
) {
    return a
}
 
main() {}