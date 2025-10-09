/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

struct S6 {
    const func fm() {}
    const S6(dd: Int64) {}
}

func h25() {
    var aa = S6(5).fm()
}
