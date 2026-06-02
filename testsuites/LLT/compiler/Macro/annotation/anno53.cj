// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan variable declaration 'c' needs either type or initializer

@Annotation
public class A {
    public const init() {}
}

@A
public struct B {
    B(@A public let p!: Int64 = 0) {}
    public let c!: Int64 = 0
}

main() {}
