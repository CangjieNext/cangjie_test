/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

// 支持Enum名称和成员查找引用/跳转 嵌套enum
enum TimeUnit9 {
    | Year(Int32)
    | Month(Int32, Int32)
    | TwoUnit(TimeUnit9, TimeUnit9)
}

var t1 = TimeUnit9.TwoUnit(TimeUnit9.Year(2020), TimeUnit9.Month(2, 9))
