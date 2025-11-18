/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface Addable {
    public common func add(other: Int64): Int64
}

public common interface Subtractable {
    public common func sub(other: Int64): Int64
}

public common interface Calculable <: Addable & Subtractable {
    public common func mul(other: Int64): Int64
    public common func div(other: Int64): Int64
}

public common class MyInt <: Calculable {
    var value = 0
    public common func add(other: Int64): Int64 {
        value + other
    }
    public common func sub(other: Int64): Int64 {
        value - other
    }
    public common func mul(other: Int64): Int64 {
        value * other
    }
    public common func div(other: Int64): Int64 {
        value / other
    }
}
