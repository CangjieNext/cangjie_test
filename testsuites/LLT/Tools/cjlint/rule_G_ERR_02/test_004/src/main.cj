// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test 1 mutiple line
func test(): Unit {
    let str1 = ##"
        Login success ,user iIUIVs and ~!@#message$%^&*()_+{
        "${sdcipher22}"|[account]\\-=`:"?>sms<,./ isecrets p
        wd
      "##

    var str2: String = """
    Login success ,user is and ~!@#$%^&*(

    )_+{penc23}|[]\\-=`:\"?><,./pwd"""


    var str3: String = ##"
    Login success ,user is and ~!@#$%^&*(

    )_+${pencode23}|[]\\-=`:\"iv?><,./ is p
    wd"##

    throw NoneValueException(str1)
    throw NoneValueException(str2)
    throw NoneValueException(str3)
    return
}

main() {
    return 0
}
