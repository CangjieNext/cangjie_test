/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public struct Data {
    public let width: Int64
    public let length: Int64
    public init(width1: Int64, length1: Int64) {
        width = width1
        length = length1
    }
    public func area(): Int64 {
        return width
    }
}
