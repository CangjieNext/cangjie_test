// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test 2 mutiple line
func test(): Unit {
    throw NoneValueException(##"
        Login success ,user iIUIVs and ~!@#message$%^&*()_+{
        "${sdcipher22}"|[account]\\-=`:"?>sms<,./ isecrets p
        wd
      "##)
    throw NoneValueException("""
    Login success ,user is and ~!@#$%^&*(

    )_+{penc23}|[]\\-=`:\"?><,./pwd""")
    throw NoneValueException(##"
    Login success ,user is and ~!@#$%^&*(

    )_+${pencode23}|[]\\-=`:\"iv?><,./ is p
    wd"##)
    return
}

main() {
    return 0
}
