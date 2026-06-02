/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 { //直接接口
    func fi1(): Int64 {
        return 1
    }
}

interface I2<T> { //泛型接口
}


open class C1 <: I1 { //类继承直接接口
    public func fc1(): Int64 {
        var y: Int64 = fi1()
        return y
    }
}

class C2 <: C1 & I1 & I2<Int32> { //类继承类，直接接口，泛型接口
    public init(){
        super()
    }

    public func fc2(): Int64 {
        var a: Int64 = fi1()
        var b: Int64 = super.fc1()
        return a + b
    }
}

class C3 <: I2<Int32> & I2<Int64> { //类继承，泛型接口 多次
    public func fc3(): Int64 {
        return 2
    }
}

main() {
    var data1 = C1().fc1()
    var data2 = C2().fc2()
    var data3 = C3().fc3()
    return 0
}



