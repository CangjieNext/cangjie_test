/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

// 定义多个enum含重名的枚举值，Enum名正常补齐
enum TimeUnit4 {
    Year
}

enum TimeUnit4_1 {
    Year
}

enum TimeUnit4_2 {
    Year
}

func test4() {
    var time = TimeUnit4.Year
    var time2 = TimeUnit4_1.Year
    var time3 = TimeUnit4_2.Year

}
