/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum_operator_overload

import default.Enum_operator_overload.pkgs.*

func test4() {
    var t1 = Time.Hour
    var t2 = Time.Hour
    var time = t1 + t2

    var t3 = Time.Day(Time.Hour)
    var t4 = Time.Day(Time.Day(Time.Hour))
    var time1 = t3 + t4
}
