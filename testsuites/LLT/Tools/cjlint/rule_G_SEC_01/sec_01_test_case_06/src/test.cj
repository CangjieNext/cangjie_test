// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A {
    // err: The default implementation may be overwirted with.
    open public func check_back_env1(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
}
open class B {
    // This method can be overwrited. An error message should be displayed.
    open public func CDB_QueryAllRecordCheck(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
    // This method can be overwrited. An error message should be displayed.
    open public func CDB_QueryAllRecordCheck1(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
    // This method can be overwrited. An error message should be displayed.
    open public func testCDB_QueryAllRecordCheck(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
    // This method can be overwrited. An error message should be displayed.
    open public func testCDB_QueryAllRecordCheck1(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
    // This method can be overwrited. An error message should be displayed.
    static func CDB_QueryAllRecordCheck2(num1: Int64, num2: Int64) {
        println("B: CDB_QueryAllRecordCheck2")
        return 0
    }
    public func CDB_QueryAllRecordCheck(num1: Int64, num2: Int64): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
    public func CDB_QueryAllRecordCheck3(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }
}
main() {
    return 0
}
