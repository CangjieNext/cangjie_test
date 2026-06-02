/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package A

internal enum test {
    RR

    public func test1(a: Int64) {
        return a
    }
}

extend test {
    public func test2(a: Int64) {
        return a
    }
}
