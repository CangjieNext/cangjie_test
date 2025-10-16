/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

class AA1 {
    const init(a: Int64) {
        const b = 0
    }
    static const b = 0
}

func h1() {
    const aa = AA1.b
}
