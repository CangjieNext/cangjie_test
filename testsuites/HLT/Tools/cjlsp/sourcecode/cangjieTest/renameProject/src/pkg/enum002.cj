/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

// 泛型enum的普通枚举值和函数形式的枚举值
enum TimeUnit3<T> {
    Year | Month | Day(T) | Hour(Int64)
}
enum TimeUnit3_1<T> {
    Year | Month | Day(T) | Hour(Int64)
}

func test3() {
    var time = TimeUnit3<Int32>.Day(3)
    var time2 = TimeUnit3_1<Int32>.Hour(23)
    var res: Int32 = match (time) {
        case Year => 0
        case Month => 1
        case Day(x) => 2
        case Hour(y) => 3
    }
    var res2: Int32 = match (time2) {
        case Year => 0
        case Month => 1
        case Day(x) => 2
        case Hour(y) => 3
    }
}
