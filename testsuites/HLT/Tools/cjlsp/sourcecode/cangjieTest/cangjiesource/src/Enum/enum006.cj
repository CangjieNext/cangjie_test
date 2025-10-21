/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

enum TimeUnit6 {
    Year
}

enum TimeUnit6_1 {
    Year | Month
}
var time = TimeUnit6.Year
var time1 = TimeUnit6_1.Year
