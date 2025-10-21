/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

class AE2 {
    let ab: Int64 = 1
    let xy: Int64 = 1
    const AE2(ab: Int64, xy!: Int64 = 8) {}
}

func hh7() {
    var aa = AE2(2, xy: 6).xy
}
