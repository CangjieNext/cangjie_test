/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class AnnotatedPropClass {
    private var _backing: Int64 = 0

    // 属性带 1 个注解
    @PropAnnotation
    public prop annotatedProp: Int64 {
        get() {
            _backing
        }
    }

    // 属性带 2 个注解（顺序：PropAnnotation 在定义顺序在先）—— 用于验证
    //   "annotations 遍历顺序取决于定义顺序"（reflect_package_classes.md:5767）
    @PropAnnotation
    @SecondPropAnnotation
    public prop multiAnnotatedProp: String {
        get() {
            "multi"
        }
    }

    // 属性重复标注同一注解 —— 用于验证 findAnnotation 文档语义
    //   "重复标注或者无法匹配时返回 None"（reflect_package_classes.md:6044）
    @PropAnnotation
    @PropAnnotation
    public prop duplicateAnnotatedProp: Bool {
        get() {
            true
        }
    }

    public init() {}
}
