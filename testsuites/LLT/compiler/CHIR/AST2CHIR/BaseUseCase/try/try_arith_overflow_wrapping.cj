// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %dumpCHIRDebug
// (Linux and CJNATIVE) EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | sed -n -r '/Func @_CN7default4testHv/,/^}$/p' | compare %f
// (Linux and CJNATIVE) ASSERT: scan-not TypeCastWithException
// (Linux and CJNATIVE) ASSERT: scan-not AddWithException
// (Linux and CJNATIVE) ASSERT: scan Int8 = DivWithException(
// (Linux and CJNATIVE) ASSERT: scan Int8 = TypeCast(
// (Linux and CJNATIVE) ASSERT: scan Int8 = Add(

@OverflowWrapping
func test() {
    try {
        let w: Int8 = -128 / -1
        let x: Int8 = Int8(129)
        let y: Int8 = 127 + 1
        print("w = " + w.toString() + "\n")
        print("x = " + x.toString() + "\n")
        print("y = " + y.toString() + "\n")
    } catch (e: Exception) {
        println("caught exception")
        print(e)
    } finally {
        print("done")
    }
}

main () {
    test()
    0
}