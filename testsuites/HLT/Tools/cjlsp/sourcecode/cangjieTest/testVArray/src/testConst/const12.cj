/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

struct S2 {
    const S2() {}
    static const num = 9
    var xyz = 0
}

func h12() {
    const aa = S2()
    S2.num
    aa.xyz
}
