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
        let arr = JArray<Int32>(10)
        for (i in 0i32..10i32) {
            arr[i] = 2 * i
        }
        let javaclass = JavaClass(arr)
        Logger.println("original-1 instance aInt[9]: ${javaclass.aInt[9]}")
        Logger.println("original-2 instance aInt[9]: ${javaclass.getAInt()[9]}")
        let arr1 = JArray<Int32>(100)
        for (i in 0i32..30i32) {
            arr1[i] = 10 * i
        }
        javaclass.setAInt(arr1)
        Logger.println("changed-1 instance aInt[9]: ${javaclass.aInt[9]}")

        Logger.println("original-1 static arrayInt[9]: ${JavaClass.arrayInt[9]}")
        Logger.println("original-2 static arrayInt[9]: ${JavaClass.getArrayInt()[9]}")
        JavaClass.setArrayInt(arr1)
        Logger.println("changed-1 instance aInt[9]: ${JavaClass.getArrayInt()[9]}")
    }
}
