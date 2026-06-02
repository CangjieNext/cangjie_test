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
public class A0 {
    public const init() {}
}

public class C0 {
    @A0
    public C0(
        @A0 public var p0: Int64,
        @A0 public let p1: String
    // @A0
    // public var p2!: Int64 = 12,
    // @A0
    // public let p3!: String = "kiki"
    ) {}
    @A0
    public init(
        @A0 p0: Int64,
        @A0 p1: String,
        @A0 p2!: Float16
    ) {
        this.p0 = p0
        this.p1 = p1
    }
}

main() {}
