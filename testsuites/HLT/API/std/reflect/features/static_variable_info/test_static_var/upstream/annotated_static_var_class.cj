/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class AnnotatedStaticVarClass {
    // 静态变量带 1 个注解
    @StaticVarAnnotation
    public static var annotatedVar: Int64 = 1

    // 静态变量带 2 个注解（顺序：StaticVarAnnotation 定义序在先）—— 用于验证
    //   "annotations 集合遍历顺序取决于定义顺序"（reflect_package_classes.md:11410）
    @StaticVarAnnotation
    @SecondStaticVarAnnotation
    public static var multiAnnotatedVar: String = "multi"

    // 静态变量重复标注同一注解 —— 用于验证 findAnnotation 文档语义
    //   "重复标注或者无法匹配时返回 None"（reflect_package_classes.md:11682）
    @StaticVarAnnotation
    @StaticVarAnnotation
    public static let duplicateAnnotatedVar: Bool = true
}
