/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Time<T> {
    Day(T)
}

interface I<T> {
    func getTime(): T
}

class Foo <: I<Time<Int32>> {
    public func getTime(): Time<Int32> {
        Time<Int32>.Day(4)
    }
}

enum TimeUnit<T> {
    Day(T)
}

struct test {
    public test(let time: TimeUnit<Int32>) {
        let aa = 1
        let bb = this.time
    }
}

main(): Int64 {
    var time: Time<Int32> = Foo().getTime()
    let data = test(TimeUnit<Int32>.Day(14))
    let time2 = data.time
    0
}
