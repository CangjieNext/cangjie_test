/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo<T,R>(para: T,para2:R) {
    var a: T = para
    var b: R = para2
    return a
}

main(): Int64 {
    var vunit: Unit = ()
    var vcptr = CPointer<Int8>()
    let cstr: CString = unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }
    var vcfunc = CFunc<() -> Unit>(vcptr)
    var a1 = foo(vunit,vunit)
    var a2 = foo(vcptr,3)
    var a3 = foo(cstr,true)
    var a4 = foo(5,vcfunc)
    var a5 = foo<Unit,Unit>(vunit,vunit)
    var a6 = foo<Int32,CFunc<() -> Unit>>(5,vcfunc)
    return 0
}
