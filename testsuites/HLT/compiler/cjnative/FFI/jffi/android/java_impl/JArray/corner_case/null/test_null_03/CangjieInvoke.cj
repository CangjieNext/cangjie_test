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
// (Android) EXEC-PIPE-1: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com 2>&1 | compare %f
// (Android) ASSERT: scan java.lang.Exception: Unexpected `null` has come from java

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        let javaclass = JavaClass(JArray<Int32>(0))
        Logger.println("javaclass.aString.length: ${javaclass.aString.length}")
        javaclass.aString[1]
    }
}
