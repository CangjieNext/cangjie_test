/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Type

enum TimeUnit {
    Day | Month | Year
}

type Time = TimeUnit

var a1 = Time.Day
var b1 = Time.Month
