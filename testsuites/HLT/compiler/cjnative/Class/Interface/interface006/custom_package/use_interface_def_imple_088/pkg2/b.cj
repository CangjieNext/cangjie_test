/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public func call<T>(): Int64 {
    if (Range<Int64>.foo4() == 2 && Range<Int64>.foo1() == 1 && Range<Int64>.foo2<Rune>(a: (1, 2))[0] == 1 &&
        Range<Int64>.foo3() == 1) {
        return 0
    } else {
        return 1
    }
}
