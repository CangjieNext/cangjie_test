/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package mp

public specific open class C1 {
    public init(a: Int64) {
        v = a + 1
    }
}

public specific class C2 <: C1 {}
