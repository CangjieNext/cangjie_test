/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func f1(){
    var vunit: Unit = ()
    var vcptr = CPointer<Int8>()
    let cstr: CString = unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }
    var vcfunc = CFunc<() -> Unit>(vcptr)
    var vrange2: Range<Int32> = 1..6:2
    var vcarrc2: Array<Int64> = [2]
    var vlist2 = ArrayList<Int64>([1, 2])
    var vhmc = HashMap<String, Bool>([("a", true)])
}
func f2<T>(a:T){
    var ssa:(Int64,T) = (1,a)
    var vunit: Unit = ()
    var vcptr = CPointer<Int8>()
    let cstr: CString = unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }
    var vcfunc = CFunc<() -> Unit>(vcptr)
    var vrange2: Range<Int32> = 1..6:2
    var vcarrc2: Array<Int64> = [2]
    var vlist2 = ArrayList<Int64>([1, 2])
    var vhmc = HashMap<String, Bool>([("a", true)])
    return a
}

main(): Int64 {
    f1()
    f2(6)
    return 0
}
