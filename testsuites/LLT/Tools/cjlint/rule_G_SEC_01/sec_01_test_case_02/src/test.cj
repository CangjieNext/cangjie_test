// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class SubA {
    // This method can be overwrited. An error message should be displayed.
    public open func check_back_env() {
        var a = 1
        if (a == 1) {
            print("SubA: open check_back_env")
        }
    }
    // This method can be overwrited. An error message should be displayed.
    public open func check_env() {}

    public func check() {}
}

open class SubB <: SubA {
    public override func check_back_env() {
        var a = 2
        if (a != 1) {
            print("SubB: override check_back_env")
        }
    }
    // This method can be overwrited. An error message should be displayed.
    public open func CDB_QueryAllRecordCheck() {
        var a = 1
        if (a == 1) {
            print("SubB: CDB_QueryAllRecordCheck")
        }
    }
}