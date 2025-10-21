/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.FuncOverload

func f5(a: Int64): Unit {}

func g5() {
    func f5(a: Float64) {
        f5(1)
    }
    f5(2.2)

}
