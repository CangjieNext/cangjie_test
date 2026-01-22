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
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/example/myapplication/Logger.java
// (Android) EXEC: %java %java_mirror_gen com.JavaClass
// (Android) EXEC-PIPE-1: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED 2>&1 | compare %f
// (Android) ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl

package UNNAMED

import java.lang.*

// 当前区分不了是否抽象函数
@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
        Logger.print("in CangjieInvoke Init\n")
        this.newoo()
    }
}
