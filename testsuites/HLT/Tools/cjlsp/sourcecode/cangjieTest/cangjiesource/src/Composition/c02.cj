/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

func h1<T>(x: T): T {
    x
}
func h2<T>(x: T): T {
    x
}

var hh1 = h1<Int32> ~> h2<Int32>
var hh4 = h1<Int32> ~> h1<Int32>
