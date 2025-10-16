// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface Stationery {
    // err: The default implementation may be overwirted with.
    func check(): Int64 {
        println("Stationery: check")
        return 0
    }
    // err: The default implementation may be overwirted with.
    func check_env(): Int64 {
        println("Stationery: check_env")
        return 0
    }
    // err: The default implementation may be overwirted with.
    func check_back_env(): Int64 {
        println("Stationery: check_back_env")
        return 0
    }
    // err: The default implementation may be overwirted with.
    func CDB_QueryAllRecordCheck(): Int64 {
        println("Stationery: CDB_QueryAllRecordCheck")
        return 0
    }
    // err: The default implementation may be overwirted with.
    func CDB_QueryAllRecordChecktest(): Int64 {
        println("Stationery: CDB_QueryAllRecordChecktest")
        return 0
    }
    // err: The default implementation may be overwirted with.
    func testCheck_back_envtest(): Int64 {
        println("Stationery: testCheck_back_envtest")
        return 0
    }
}
class Stu <: Stationery {
    public func check(): Int64 {
        println("Stu: check")
        return 0
    }
    public func check_env(): Int64 {
        println("Stu: check_env")
        return 0
    }
    public func check_back_env() {
        println("Stu: check_back_env")
        return 0
    }
    public func CDB_QueryAllRecordCheck() {
        println("Stu: CDB_QueryAllRecordCheck")
        return 0
    }
    func testcheck_env(): Int64 {
        println("Stu: testcheck_env")
        return 0
    }
}

open class SubC {
    // This method can be overwrited. An error message should be displayed.
    open func check(num1: Int64, num2: Int64): Int64 {
        println("SubC: check")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    open func cCheck1(num1: Int64, num2: Int64): Int64 {
        println("SubC: cCheck1")
        return 0
    }
    func cCheck2(num1: Int64, num2: Int64): Int64 {
        println("SubC: cCheck2")
        return 0
    }
}
// 'open' modifier is illegal for function declaration in extend body;
// cannot override function in extend of supertype.So the method here does not get an error.
extend SubC <: Stationery {
    public func check(): Int64 {
        println("SubC: check")
        return 0
    }
    public func check_env(): Int64 {
        println("SubC: check_env")
        return 0
    }
    public func check_back_env() {
        println("SubC: check_back_env")
        return 0
    }
    public func CDB_QueryAllRecordCheck() {
        println("SubC: CDB_QueryAllRecordCheck")
        return 0
    }
    func test2(): Int64 {
        println("SubC: test2")
        return 0
    }
}
