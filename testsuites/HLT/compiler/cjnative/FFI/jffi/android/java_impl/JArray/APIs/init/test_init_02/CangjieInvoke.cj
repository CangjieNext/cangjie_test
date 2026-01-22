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
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/example/myapplication/Logger.java
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) EXEC: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com

// 超大数组，大小为 Int32.Max-2
package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        let javaclass = JavaClass()
        Logger.println("orginal-1 size aInt: ${javaclass.aInt.length}")
        Logger.println("orginal-1 size arrLong: ${JavaClass.arrLong.length}")

        Logger.println("changed-1 value arrLong: ${JavaClass.arrLong[0]}, ${JavaClass.arrLong[21474]}")
        var arr = JArray<Int32>(21474 + 1)
        arr[0] = 0
        arr[21474] = 21474
        javaclass.aInt = arr
        JavaClass.arrLong = JArray<Int64>(0)

        Logger.println("changed-1 size aInt: ${javaclass.aInt.length}")
        Logger.println("changed-1 value aInt: ${javaclass.aInt[0]}, ${javaclass.aInt[21474]}")
        Logger.println("changed-2 size arrLong: ${JavaClass.arrLong.length}")
    }
}
