/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

enum TimeUnit8 {
    Year
}

enum Time2 {
    Year(TimeUnit8)
}

class DataClass {
    var a: TimeUnit8
    init(x: TimeUnit8) {
        a = x
    }
    func foo(): TimeUnit8 {
        var a = TimeUnit8.Year
        return a
    }

    static func bar(x: TimeUnit8): TimeUnit8 {
        return x
    }
}

struct DataRecord {
    var a: TimeUnit8 = TimeUnit8.Year

    init(x: TimeUnit8) {
        a = x
    }

    func foo(): TimeUnit8 {
        return a
    }

    static func foo1(x: TimeUnit8): TimeUnit8 {
        return x
    }
}

func test8() {
    DataClass(TimeUnit8.Year)
    DataRecord(TimeUnit8.Year)
    DataClass.bar(TimeUnit8.Year)
    Time2.Year(TimeUnit8.Year)

}
