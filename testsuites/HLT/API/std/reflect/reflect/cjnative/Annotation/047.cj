/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.reflect.*

@Annotation
public class A0<G0> {
    public const init(p0: G0) {}
}

@A0["hello"]
public class C0 {}

main(): Unit {
    TypeInfo.of<C0>().findAnnotation<default.A0<String>>().getOrThrow()
}
