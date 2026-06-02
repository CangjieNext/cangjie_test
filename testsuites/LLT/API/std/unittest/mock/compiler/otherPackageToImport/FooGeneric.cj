/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public class FooGeneric<K> {
    public func foo(x: PassedBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
    public func bar(x: K): ReturnedBar {
        println("original `bar` was called")
        ReturnedBar("original")
    }
    public func boo<T>(x: K, y: T): ReturnedBar {
        println("original `boo` was called")
        ReturnedBar("original")
    }
    public func bee<T, R>(x: K, y: T): R {
        println("original `bee` was called")
        ReturnedBar("original") as R ?? throw Exception()
    }
    private func bee2<T, R>(x: K, y: T): R {
        println("original `bee` was called")
        ReturnedBar("original") as R ?? throw Exception()
    }
    func boo2<T>(y: T): ReturnedBar {
        println("original `boo` was called")
        ReturnedBar("original")
    }

    public func callGenericBee2<T, R>(x: K, y: T): R {
        return bee2<T, R>(x, y)
    }

    public func callSpecificBee2(x: K): ReturnedBar {
        return bee2<Int64, ReturnedBar>(x, 44)
    }

    public func callSpecificBoo2(): ReturnedBar {
        return boo2<String>("123")
    }

    public func callSpecificBee(x: K): ReturnedBar {
        return bee<Int64, ReturnedBar>(x, 44)
    }
}

public func makeTypeInstanceOfFooAndCallBar(x: FooGeneric<Int32>) {
    println("Return value: " + x.bar(12).toString())
}

public func makeTypeInstanceOfFooAndCallBee(x: FooGeneric<Array<Int64>>) {
    println("Return value: " + x.bee<String, Int64>([2, 5], "12").toString())
}
