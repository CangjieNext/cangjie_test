// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test 1 str binary expr
func test(): Unit {
    let str1 = "Password are: " + " pSd psd " + "Psd, " +  "psD  psd " + #"'PSD'"#
    throw NoneValueException(str1)
    return
}

main() {
    return 0
}
