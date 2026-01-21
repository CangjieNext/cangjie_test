/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public interface I {
    platform public func foo(): Int64 {
        return 0
    }
}

platform public enum E <: I {
    elem

    platform public override func foo(): Int64 {
        return 1
    }
}

platform public struct S <: I {
    platform public override func foo(): Int64 {
        return 1
    }
}
