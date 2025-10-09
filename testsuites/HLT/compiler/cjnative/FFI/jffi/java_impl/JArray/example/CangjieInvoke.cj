/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com UNNAMED
// (not Windows and Android) EXEC: %javac com/*.java
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. com.java.app.Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java
// (not Windows and Android) ASSERT: scan java: JavaClass()
// (not Windows and Android) ASSERT: scan java: 0th of long[] - 6
// (not Windows and Android) ASSERT: scan java: 1th of long[] - 7
// (not Windows and Android) ASSERT: scan java: 2th of long[] - 73
// (not Windows and Android) ASSERT: scan java: 0th of JavaClass[] - 55312
// (not Windows and Android) ASSERT: scan java: 1th of JavaClass[] - 55312
// (not Windows and Android) ASSERT: scan java: 2th of JavaClass[] - 55312
// (not Windows and Android) ASSERT: scan cangjie: CangjieInvoke()
// (not Windows and Android) ASSERT: scan cangjie: 5th of F64 array - 1.000330
// (not Windows and Android) ASSERT: scan cangjie: 2nd of F64 array - -9.554000
// (not Windows and Android) ASSERT: scan cangjie: length of F64 array - 5
// (not Windows and Android) ASSERT: scan cangjie: 2nd of JavaClass array - 55312
// (not Windows and Android) ASSERT: scan cangjie: length of JavaClass array - 9
// (not Windows and Android) ASSERT: scan cangjie: 1st of I64 array - 6
// (not Windows and Android) ASSERT: scan cangjie: 2nd of I64 array - 7
// (not Windows and Android) ASSERT: scan cangjie: 3rd of I64 array - 13
// (not Windows and Android) ASSERT: scan cangjie: 1st of JavaClass array from Java - 55312
// (not Windows and Android) ASSERT: scan cangjie: 2nd of JavaClass array from Java - 55312
// (not Windows and Android) ASSERT: scan cangjie: 3rd of JavaClass array from Java - 55312
// (not Windows and Android) ASSERT: scan cangjie: length of I64 array - 44

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public func foo(): JArray<Int64> {
        JArray<Int64>(44)
    }

    public init() {
        println("cangjie: CangjieInvoke()")

        let arr0 = JArray<Float64>(5)
        arr0[4] = 1.00033
        arr0[1] = -9.554
        println("cangjie: 5th of F64 array - " + arr0[4].toString())
        println("cangjie: 2nd of F64 array - " + arr0[1].toString())
        println("cangjie: length of F64 array - " + arr0.length.toString())

        let arr1 = JArray<JavaClass>(9)
        arr1[1] = JavaClass()
        println("cangjie: 2nd of JavaClass array - " + arr1[1].getInt().toString())
        println("cangjie: length of JavaClass array - " + arr1.length.toString())

        let arr2 = getArr()
        println("cangjie: 1st of I64 array - " + arr2[0].toString())
        println("cangjie: 2nd of I64 array - " + arr2[1].toString())
        println("cangjie: 3rd of I64 array - " + arr2[2].toString())
        arr2[2] = 73
        takeArr(arr2)

        let arr3 = getArr2()
        println("cangjie: 1st of JavaClass array from Java - " + arr3[0].getInt().toString())
        println("cangjie: 2nd of JavaClass array from Java - " + arr3[1].getInt().toString())
        println("cangjie: 3rd of JavaClass array from Java - " + arr3[2].getInt().toString())
        arr3[2] = JavaClass()
        takeArr2(arr3)

        let arr4 = this.foo()
        println("cangjie: length of I64 array - " + arr4.length.toString())
    }
}
