// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo1(){
    let str1 = "passwd " + "iv " + "PSD"
    let str2 = "d " + #"'sms'"#
    let str3 = str2 + " enc"
    let str4 = str1 + str2

    throw NoneValueException(str1 + "Password are: ") //passwd iv PSDPassword are:
    throw NoneValueException(str1 + str2) //passwd iv PSDd 'sms'
    throw NoneValueException(str3) //d 'sms' enc
    throw NoneValueException(str1 + str3) //passwd iv PSDd 'sms' enc
    throw NoneValueException(str4) // passwd iv PSDd 'sms'
}

main(): Int64 {
  0
}
