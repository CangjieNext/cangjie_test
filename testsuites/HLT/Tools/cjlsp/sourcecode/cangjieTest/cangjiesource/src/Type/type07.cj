/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Type

//内置泛型类型的别名
type T1T<T> = Option<T>

func f17() {
    let x: T1T<Int64> = T1T<Int64>.None
    let y: T1T<Int64> = T1T<Int64>.Some(6)
}
