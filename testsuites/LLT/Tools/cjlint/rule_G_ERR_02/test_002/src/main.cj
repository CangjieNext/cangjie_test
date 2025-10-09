// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// var test
func test(): Unit {
    var str1: String = "Login success ,user is and ~!@#$%^&*()_+{pdec23}|[]\\-=`:\"?><,./ is"
    var str2: String = """
    Login success ,pwd is "password1", user is account and ~!@#$%^&*(

    )_+{penc23}|[]\\-=`:\"?><,./ is enc"""
    var str3: String = """"pwd"is ",password,""""
    var str4: String = """"pwd "is "passwordd""""
    throw NoneValueException(str1)
    throw NoneValueException(str2)
    throw IllegalArgumentException(str3)
    throw IllegalArgumentException(str4)

    return
}

main() {
    return 0
}
