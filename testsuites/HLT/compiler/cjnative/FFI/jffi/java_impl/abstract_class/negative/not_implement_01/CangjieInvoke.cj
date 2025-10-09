/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com
// (not Windows and Android) EXEC: %javac com/*.java
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC-PIPE-1: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d . 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan error

package UNNAMED

import java.lang.*

// 当前区分不了是否抽象函数
@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
        print("in CangjieInvoke Init\n", flush: true)
        this.newoo()
    }
}
