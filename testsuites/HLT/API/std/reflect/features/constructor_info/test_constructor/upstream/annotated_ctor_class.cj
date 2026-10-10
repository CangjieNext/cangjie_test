/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class AnnotatedCtorClass {
    public var value: Int64 = 0i64

    // 构造子带 1 个注解
    @CtorAnnotation
    public init() {}

    // 构造子带 2 个注解（顺序：CtorAnnotation 在定义顺序在先）—— 用于验证
    //   "annotations 遍历顺序取决于定义顺序"（reflect_package_classes.md:906）
    @CtorAnnotation
    @SecondAnnotation
    public init(value: Int64) {
        this.value = value
    }
}

// 构造体内抛异常的类 —— 用于真实物化 RULE_APPLY_CTOR_THROWS
//   （文档 :1050："被调用的构造函数内部抛出异常，则该异常将被封装为 Exception 异常并抛出"）。
//   探针实证（_probe/src/throw_ctor.cj）：普通 init() 体内 throw 合法，
//   apply([]) 实测抛出 Exception: ctor internal error。
public class ThrowCtorClass {
    public var ok: Bool = false

    public init() {
        throw Exception("ctor internal error")
    }

    public init(v: Int64) {
        this.ok = true
    }
}
