/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

import pkga.Boo

public class Coo <: Boo<Int32> {
    public static redef func foo<V>(x: Int32, y: V) {
        return y
    }
}
