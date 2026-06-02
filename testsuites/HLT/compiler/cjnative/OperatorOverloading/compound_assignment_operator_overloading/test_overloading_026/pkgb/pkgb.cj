/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

public open class TRB {
    public var b: Int32 = 2
    public init(input: Int32) {
        b = input
    }

    public open operator func <<(input: TRB): TRB {
        return TRB(0)
    }
    public open operator func >>(input: TRB): TRB {
        return TRB(0)
    }
    public open operator func &(input: TRB): TRB {
        return TRB(0)
    }
    public open operator func ^(input: TRB): TRB {
        return TRB(0)
    }
    public open operator func |(input: TRB): TRB {
        return TRB(0)
    }
}
