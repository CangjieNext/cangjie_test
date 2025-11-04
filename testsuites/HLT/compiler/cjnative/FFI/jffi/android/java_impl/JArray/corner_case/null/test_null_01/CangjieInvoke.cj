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
public class CangjieInvoke <: JObject {
    public init() {
        let javaclass = JavaClass(JArray<Int32>(0))
        let arr = JArray<Int32>(1)
        arr[0] = 4321
        javaclass.aInt = arr
        Logger.println("javaclass.aInt[0]: ${javaclass.aInt[0]}")
        JavaClass.setArrayInt(arr)
        Logger.println("JavaClass.arrayInt[0]: ${JavaClass.arrayInt[0]}")

        arr[0] = 54321
        Logger.println("javaclass.aInt[0]: ${javaclass.aInt[0]}")
        Logger.println("JavaClass.arrayInt[0]: ${JavaClass.arrayInt[0]}")

        var jstr = JString("hello, 仓颉")
        javaclass.aString[1] = jstr
        Logger.println("javaclass.aString[1]: ${javaclass.aString[1].toString()}")
        jstr = JString("hello, world")
        Logger.println("javaclass.aString[1]: ${javaclass.aString[1].toString()}")
    }
}
