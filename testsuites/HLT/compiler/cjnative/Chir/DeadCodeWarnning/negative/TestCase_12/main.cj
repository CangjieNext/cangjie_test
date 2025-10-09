/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package package_a

main(): Unit {
    let variable: Int64 = 2i64
    for (_ in variable..100i64 : variable + 1i64) {
        break
    }
}
