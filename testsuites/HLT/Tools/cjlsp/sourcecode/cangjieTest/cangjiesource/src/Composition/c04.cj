/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

func f_4(x: Int32) {
    return 1
}
func h_4<T>(x: T): T {
    x
}

var ss1 = f_4 ~> h_4<Int64>
var ss2 = h_4<Int32> ~> f_4

