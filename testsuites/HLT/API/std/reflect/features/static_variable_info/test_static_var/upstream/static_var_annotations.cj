/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

// 自定义注解（@Annotation 元注解声明反射可见）
@Annotation
public class StaticVarAnnotation {
    public let data: String
    public const init() {
        this.data = "StaticVarAnnotation's data"
    }
}

@Annotation
public class SecondStaticVarAnnotation {
    public let code: Int64
    public const init() {
        this.code = 42
    }
}
