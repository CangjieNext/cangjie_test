/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public open class TRA {
    public var a: Int32 = 1
    public init(input: Int32) {
        a = input
    }

    public open operator func **(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func *(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func /(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func %(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func +(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func -(input: TRA): TRA {
        return TRA(0)
    }
    public open operator func -(): TRA {
        return TRA(0)
    }
}
