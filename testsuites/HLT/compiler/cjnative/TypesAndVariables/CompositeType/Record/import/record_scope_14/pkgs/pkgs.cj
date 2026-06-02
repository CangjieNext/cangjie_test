/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

public struct Data {
    public var width: Int32 = 1
    public var length: Int32 = 2
    public init(width1: Int32, length1: Int32) {
        width = width1
        length = length1
    }
    public func area(): Int32 {
        return width * length
    }
}
