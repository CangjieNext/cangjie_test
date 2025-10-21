/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Arrary

// Array关键字、Array类型变量应用于class、record、enum内部
class DataClass {
    var range:Array<Int64>
    init(x:Array<Int64>) {
        range = x
    }
    func foo():Array<Int64> {
        var range = [1,2,3,4]
        return range
    }

    static func bar(x:Array<Int64>):Array<Int64> {
        return x
    }
}

struct DataRecord {
    var range:Array<Int64> = [1,2,3,4]

    init(x:Array<Int64>) {
        range = x
    }

    func foo1():Array<Int64> {
        return range
    }

    static func foo(x:Array<Int64>):Array<Int64> {
        return x
    }
}

enum Time2 { Year(Array<Int64>)}

func test3(){
    DataClass([1,2,3,4])
    DataRecord([1,2,3,4])
    DataClass.bar([1,2,3,4])
    DataRecord.foo([1,2,3,4])
    Time2.Year([1,2,3,4])

}
