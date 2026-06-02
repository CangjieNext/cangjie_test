/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

class AA2 {
    const AA2(a: Int64) {
        const b = 0
    }

    static const b = 0
    let c = 0
    func fa() {}
}

func h2() {
    const aa = AA2(8)
    var bb = AA2(8).fa
    AA2.b
    aa.c
    aa.fa
}
