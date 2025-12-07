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

public interface A {
    @A0
    static prop p: Int64 {
        get() {
            1
        }
    }
    @A0
    static func f(): Int64 {
        2
    }
}

public interface B <: A {
    static prop p: Int64 {
        get() {
            3
        }
    }
    static func f(): Int64 {
        4
    }
}

main() {
    TypeInfo.of<B>().getStaticProperty("p").annotations.size |> println
    TypeInfo.of<B>().getStaticFunction("f").annotations.size |> println
}
