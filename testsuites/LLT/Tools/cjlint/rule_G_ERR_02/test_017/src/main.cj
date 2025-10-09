// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class ClassTest {
    private let str1 =  "Password are: " + "iv " + #"'PSD'"#
    private let str2 =  "##sms enc pwdd"
    public func func1() {
        throw NoneValueException(str1)
        return
    }

    private func func2() {
        throw NoneValueException(str2)
        return
    }
}
main(): Int64 {
    return 0
}
