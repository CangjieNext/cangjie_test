/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

struct S4 {
    public static const func ff():Unit {}
    public static const func fdf():Unit {}
}

func h14() {
    var gg = S4.ff
    var gg2 = S4.fdf
}
