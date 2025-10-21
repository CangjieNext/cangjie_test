/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

struct AA4 {
    static const func fb() {}
    static const num = 8
}

func hh9() {
    var a = AA4.fb
    var b = AA4.num
}
