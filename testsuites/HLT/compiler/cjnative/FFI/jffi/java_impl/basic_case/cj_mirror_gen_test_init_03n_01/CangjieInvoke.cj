/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: com
// (not Windows and Android) EXEC: %javac com/*.java
// (not Windows and Android) EXEC: %java %java_mirror_gen com.Init03
// (not Windows and Android) EXEC: cat UNNAMED/src/*.cj
// (not Windows and Android) ERRCHECK: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) ASSERT: scan sema_

package UNNAMED

import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        let class_01 = Init03(1, 1)
    }
}
