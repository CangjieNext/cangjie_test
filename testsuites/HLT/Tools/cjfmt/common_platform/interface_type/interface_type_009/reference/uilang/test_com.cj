/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public interface I {
    common public func foo(): Int64 {
        return 0
    }
}

common public enum E <: I {
    elem

    common public override func foo(): Int64 {
        return 1
    }
}

common public struct S <: I {
    common public override func foo(): Int64 {
        return 1
    }
}
