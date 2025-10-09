/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
@CallingConv[STDCALL]
foreign func testfuncstacall(fmt: CString): CString
@CallingConv[STDCALL]
foreign func fflushOutstdcall(): Unit


func test14(){
    var count = 0
    var a: CString = unsafe { LibC.mallocCString("Hello ") }
    var b: CString = unsafe { LibC.mallocCString("hello world\n") }
    var c: CString = unsafe { LibC.mallocCString("HELLO WORLD\n") }
    var d: CString = unsafe { LibC.mallocCString("HELLO WORLD") }
    var str: CString
    unsafe { str = testfuncstacall(a) }
    unsafe { printf(str) }
    unsafe { fflushOutstdcall() }
}
