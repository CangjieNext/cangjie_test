// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgA

open class AAAA {
    public var y: UInt64 = 888
}

public class CCCC <: AAAA {
    public var x = 999
}

public enum EXHAUSTIVE_OTHER<T> {
    A | B | C(CCCC) | D(T)
}
