/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

class AC {
    AC(var aa: (HH: AC, MM: Int64) -> Int64) {}
    init(aa: (AA: AC, BB: Int64) -> Int64, bb: Int64) {
        this.aa = aa
    }
}

func test22() {
    var gg = AC({a: AC, b: Int64 => b})
}
