/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class AnnotatedFuncClass {
    public var value: Int64 = 0i64

    // 函数带 1 个注解
    @FuncAnnotation
    public func annotatedMethod(): Int64 {
        return 42
    }

    // 函数带 2 个注解（顺序：FuncAnnotation 在定义顺序在先）—— 用于验证
    //   "annotations 遍历顺序取决于定义顺序"（reflect_package_classes.md:4589）
    @FuncAnnotation
    @SecondFuncAnnotation
    public func multiAnnotatedMethod(s: String): String {
        return s
    }
}
