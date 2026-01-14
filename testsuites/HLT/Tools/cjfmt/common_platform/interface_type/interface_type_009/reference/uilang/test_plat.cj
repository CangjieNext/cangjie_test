/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public interface I {
    specific public func foo(): Int64 {
        return 0
    }
}

specific public enum E <: I {
    elem

    specific public override func foo(): Int64 {
        return 1
    }
}

specific public struct S <: I {
    specific public override func foo(): Int64 {
        return 1
    }
}
