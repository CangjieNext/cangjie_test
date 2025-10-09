/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

// 泛型enum的普通枚举值和函数形式的枚举值
enum Time_Unit3<T> {
    Year | Mon1th | Day3(T) | Hour(Int64)
}
enum Time_Unit3_1<T> {
    Year | Mon1th | Day3(T) | Hour(Int64)
}
