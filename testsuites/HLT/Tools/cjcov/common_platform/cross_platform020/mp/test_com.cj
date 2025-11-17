/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface Add<T1, T2> {
    common operator func +(right: T1): T1
}

common extend Rune <: Add<Rune, UInt32> {
    public common operator func +(right: Rune): Rune
}
