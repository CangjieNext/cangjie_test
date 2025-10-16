// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(): Unit {
    let str = "Password are: " + "iv " + #"'PSD'"#
    if(str != ""){
        var a = match(str){
        case _ => throw NoneValueException(str)
        }
    }

    return
}

main() {
    return 0
}
