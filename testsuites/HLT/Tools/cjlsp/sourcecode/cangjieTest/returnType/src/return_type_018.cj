/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType
import std.collection.HashMap

func f018() {
    return HashMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
}

func base18() {
    f018()
}

