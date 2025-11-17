/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform interface Add<T1, T2> {
    platform operator func +(right: T1): T1 {
        right
    }
}

platform extend Rune <: Add<Rune, UInt32> {
    public platform operator func +(right: Rune): Rune {
        UInt32(right)
        r'C'
    }
}
