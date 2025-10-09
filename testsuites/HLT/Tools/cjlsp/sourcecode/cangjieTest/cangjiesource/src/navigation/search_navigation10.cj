/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

//成员变量形参暂不支持
class C4 {
    C4(
        name: String,
        annotation!: String = "nnn",
        var width!: Int64 = 1,
        var length!: Int64,
        private var height!: Int64 = 3
    ) {}
}
