/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// 对于拥有无参构造函数的注解类型，声明时可以省略括号。
import std.reflect.*

@Annotation
public class MyAnnotation {
    public const init() {}
}

@MyAnnotation // ok
class Foo {}

main() {}
