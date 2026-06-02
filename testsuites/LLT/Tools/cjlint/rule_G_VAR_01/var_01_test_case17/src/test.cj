// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package justtest

// import std.collection.forEach
import std.collection.collectString

main() {
    // demo()
    let originalStr = "abcdef"
    println(originalStr |> collectString<Byte>(delimiter: "-"))
}

// 一个迭代器，内部维护迭代的次数，保存需要迭代的数据
class MyIteratorClass<T> <: Iterator<T> {
    var index: Int = 0
    let dataList: Array<T>
    init(dataList: Array<T>) {
        this.dataList = dataList
    }
    public func next(): Option<T> {
        let v = dataList.get(index)
        index += 1
        return v
    }
}
//自定义可迭代的类
class MyIterableClass<T> <: Iterable<T> {
    let list: Array<T>
    let name: String = 'MylterableClass'
    init(list: Array<T>) {
        this.list = list
    }
    //需要返回一个迭代器用来迭代数据
    //这里迭代的数据是this.list
    public func iterator(): Iterator<T> {
        MyIteratorClass(this.list)
    }
}

func demo() {
    let list = Array(5) {i => i * 2}

    let myCls: MyIterableClass<Int64> = MyIterableClass(list)
    for (i in myCls) {
        println(i)
    }
    println("---------------")
}
