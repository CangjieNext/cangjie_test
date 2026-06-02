/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit1<T> {
    Year(T)

    func funcdemo2(a: Int32, b: T): T {
        var num3: T = b
        return b
    }
    public static func foo1(b: T): Int32 {
        return 1
    }
}

class C1<T>{}

main() {
    var b1:C1<Float64> = C1<Float64>()
    var a1 = TimeUnit1<Int64>.foo1(2)
    var a2 = TimeUnit1<Bool>.Year(true).funcdemo2(1, true)
    var a3 = TimeUnit1<Array<Int64>>.foo1([1])
    var a4 = TimeUnit1<C1<Float64>>.foo1(b1)
    0
}
