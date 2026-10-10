// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

public class Tagged {
    public var tag: String
    public var code: Int64
    public init() {
        this.tag = "tagged"
        this.code = 0
    }
    public func name(): String {
        return tag
    }
    public func bump(): Int64 {
        code += 1
        return code
    }
}
