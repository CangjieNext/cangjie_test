// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import a.*

func foo1(){
    let str1 =  "Password are: " + "iv " + #"'PSD'"#
    {
      throw NoneValueException(str1)
    }()

    throw NoneValueException(str3)
}

main(): Int64 {
  0
}
