// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// There are members decorated with open. Can be overwrited.
open class People {
    var name = ""
    var sex = ""

    // This method can be overwrited. An error message should be displayed.
    open func check(): Int64 {
        println("people check")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    open func check_env() {
        println("People: check_env")
        return 0
    }
    // Cannot be rewritten. No error is reported.
    func check_back(): Int64 {
        println("People: check_back")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    static func CDB_QueryAllRecordCheck(): Int64 {
        println("People: CDB_QueryAllRecordCheck")
        return 0
    }
}
open class Worker <: People {
    var wage: Int64 = 0

    func work(): Int64 {
        println("Worker: work")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    override open func check(): Int64 {
        println("Worker: check")
        return 0
    }
    // Cannot be rewritten. No error is reported.
    override func check_env(): Int64 {
        println("Worker: check_env")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    open func check_back_env(): Int64 {
        println("Worker: check_back_env")
        return 0
    }
}
open class Tool <: Worker {
    var types: String = ""

    override func check(): Int64 {
        println("Tool: check")
        return 0
    }
    override func check_back_env(): Int64 {
        println("Tool: check_back_env")
        return 0
    }
    // Cannot be rewritten. No error is reported.
    public func check(num: Int64): Int64 {
        println("Tool: checknum")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    public open func check(num1: Int64, num2: Int64): Int64 {
        println("Tool: check_num1_num2")
        return 0
    }
    // This method can be overwrited. An error message should be displayed.
    static redef func CDB_QueryAllRecordCheck(): Int64 {
        println("Tool: CDB_QueryAllRecordCheck")
        return 0
    }
}
class Shop <: Tool {
    var num: String = ""

    static redef func CDB_QueryAllRecordCheck(): Int64 {
        println("Shop: CDB_QueryAllRecordCheck")
        return 0
    }
}