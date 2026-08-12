// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
/* SCAN
CALL BBB
CALL BBB
CALL BBB
*/

open class AAA {
    public open func print():Unit{
        println("CALL AAA")
    }
}

open class BBB <: AAA{
    public open override func print():Unit{
        println("CALL BBB")
    }
}

var bObj:AAA = BBB()

func cangjieFunc(){ bObj.print() }

main(): Int64 {
    bObj.print()
    let cFunc1:CFunc<() -> Unit> = {=> bObj.print() }
    unsafe{ cFunc1() }
    let cFunc2:CFunc<() -> Unit> = {=> cangjieFunc() }
    unsafe{ cFunc2() }
    return 0
}
