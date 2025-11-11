/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Android) DEPENDENCE: com MainInstrumentedTest.java  
// (Android) EXEC: python3 %java_interop_setup
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/hello/world/cangjieinterophelloworld/Logger.java
// (Android) EXEC: %java %java_mirror_gen com.Init01
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) EXEC-PIPE-1: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com 2>&1 | compare %f
// (Android) ASSERT: scan cjEntryPoint.cjFoo();
// (Android) ASSERT: scan CangjieInvoke.cjGoo();

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        let class_01 = Init01()
    }
}

extend CangjieInvoke {
    public func cjFoo() {}

    public static func cjGoo() {}
}
