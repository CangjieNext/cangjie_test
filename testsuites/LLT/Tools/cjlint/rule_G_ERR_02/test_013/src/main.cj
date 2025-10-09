// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(): Unit {
    let str1 = ##"
        Login success ,user iIUIVs and ~!@#message$%^&*()_+{
        "${sdcipher22}"|[account]\\-=`:"?>sms<,./ isecrets p
        wd
      "##

    try {
        throw NoneValueException(str1)
    } catch (e: NoneValueException) {
    }

    return
}

main() {
    return 0
}
