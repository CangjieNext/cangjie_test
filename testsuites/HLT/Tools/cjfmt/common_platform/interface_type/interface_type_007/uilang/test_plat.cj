/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific interface Addable {
    public specific func add(other: Int64): Int64{
        value + other
    }
}

public specific interface Subtractable {
    public specific func sub(other: Int64): Int64{
        value - other
    }
}

public specific interface Calculable <: Addable & Subtractable {
    public specific func mul(other: Int64): Int64{
        value * other
    }
    public specific func div(other: Int64): Int64{
        value / other
    }
}
