/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Android) DEPENDENCE: com UNNAMED MainInstrumentedTest.java 
// (Android) EXEC: python3 %java_interop_setup
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/hello/world/cangjieinterophelloworld/Logger.java
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) EXEC: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public func foo(): JArray<Int64> {
        JArray<Int64>(44)
    }

    public init() {
        Logger.println("cangjie: CangjieInvoke()")

        let arr0 = JArray<Float64>(5)
        arr0[4] = 1.00033
        arr0[1] = -9.554
        Logger.println("cangjie: 5th of F64 array - " + arr0[4].toString())
        Logger.println("cangjie: 2nd of F64 array - " + arr0[1].toString())
        Logger.println("cangjie: length of F64 array - " + arr0.length.toString())

        let arr1 = JArray<JavaClass>(9)
        arr1[1] = JavaClass()
        Logger.println("cangjie: 2nd of JavaClass array - " + arr1[1].getInt().toString())
        Logger.println("cangjie: length of JavaClass array - " + arr1.length.toString())

        let arr2 = getArr()
        Logger.println("cangjie: 1st of I64 array - " + arr2[0].toString())
        Logger.println("cangjie: 2nd of I64 array - " + arr2[1].toString())
        Logger.println("cangjie: 3rd of I64 array - " + arr2[2].toString())
        arr2[2] = 73
        takeArr(arr2)

        let arr3 = getArr2()
        Logger.println("cangjie: 1st of JavaClass array from Java - " + arr3[0].getInt().toString())
        Logger.println("cangjie: 2nd of JavaClass array from Java - " + arr3[1].getInt().toString())
        Logger.println("cangjie: 3rd of JavaClass array from Java - " + arr3[2].getInt().toString())
        arr3[2] = JavaClass()
        takeArr2(arr3)

        let arr4 = this.foo()
        Logger.println("cangjie: length of I64 array - " + arr4.length.toString())
    }
}
