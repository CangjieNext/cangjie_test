/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

func g<T>(x: T): T {
    x
}
var res4 = a1 + 1 |> g<Int32>
var res5 = true |> g<Bool>
