/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    public let a1 = 10
    @Deprecated["this value is deprecated", strict: false] public let a4 = 40
    @Deprecated["this value is deprecated", strict: true] public let a7 = 70
}

public func f(){
    return 0
}