/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args

// 对于一个被注解的对象，允许相同注解出现超过1次

@Annotation
public class A0 {
    public const init() {}
}

@A0
@A0
class C0 {}

main() {}
