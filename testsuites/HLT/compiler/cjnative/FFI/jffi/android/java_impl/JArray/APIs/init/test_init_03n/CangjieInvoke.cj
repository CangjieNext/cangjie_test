/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Android) DEPENDENCE: com UNNAMED  
// (Android) EXEC: python3 %java_interop_setup
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/example/myapplication/Logger.java
// (Android) ERRCHECK: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) ASSERT: scan sema_cannot_convert_literal
// (Android) ASSERT: scan sema_exceed_num_value_range

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        let javaclass = JavaClass()
        Logger.println("orginal-1 size aInt: ${javaclass.aInt.length}")
        Logger.println("orginal-1 size arrLong: ${JavaClass.arrLong.length}")

        Logger.println("changed-1 value arrLong: ${JavaClass.arrLong[0]}, ${JavaClass.arrLong[99999]}")
        var arr = JArray<Int32>(2147483648)
        arr[0] = 0
        arr[2147483648] = 2147483648
        javaclass.aInt = arr
        JavaClass.arrLong = JArray<Int64>(0)

        Logger.println("changed-1 size aInt: ${javaclass.aInt.length}")
        Logger.println("changed-1 value aInt: ${javaclass.aInt[0]}, ${javaclass.aInt[2147483648]}")
        Logger.println("changed-2 size arrLong: ${JavaClass.arrLong.length}")
    }
}
