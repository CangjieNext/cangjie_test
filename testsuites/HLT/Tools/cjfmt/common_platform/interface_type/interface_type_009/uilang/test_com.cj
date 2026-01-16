/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface I {
    public common func foo(): Int64 {
        return 0
    }
}
public common enum E <: I{
    elem
    public common override func foo(): Int64 {
        return 1
    }
}
common public struct S <: I {
    public common override func foo(): Int64 {
        return 1
    }
    public init() {}
}
