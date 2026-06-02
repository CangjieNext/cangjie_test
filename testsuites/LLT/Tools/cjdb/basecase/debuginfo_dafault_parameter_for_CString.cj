// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var str = "o.O"

public func fun_C1_defalut(para_1 : CString, para_2!:CString=unsafe {LibC.mallocCString("- =")})
{
    var a = 10
    return 0
}

func foo(para_2!:CString=unsafe {LibC.mallocCString(str)})
{
    var a = 10
    return 0
}

func goo(para_2!:Array<CString> = [unsafe {LibC.mallocCString("aaa")}, unsafe {LibC.mallocCString("bbb")}, unsafe {LibC.mallocCString(str)}])
{
    var a = 10
    return 0
}

main() {
    var str_1 = unsafe {LibC.mallocCString("V50")}
    var f1 = fun_C1_defalut(str_1)
    var f2 = foo()
    var f3 = goo()
    return 120
}