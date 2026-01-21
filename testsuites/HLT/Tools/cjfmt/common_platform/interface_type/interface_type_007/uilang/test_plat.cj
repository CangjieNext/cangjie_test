/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform interface Addable {
    public platform func add(other: Int64): Int64{
        value + other
    }
}

public platform interface Subtractable {
    public platform func sub(other: Int64): Int64{
        value - other
    }
}

public platform interface Calculable <: Addable & Subtractable {
    public platform func mul(other: Int64): Int64{
        value * other
    }
    public platform func div(other: Int64): Int64{
        value / other
    }
}
