// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package ohos.ability

import std.deriving.*

@!APILevel[
12,
atomicservice: true,
stagemodelonly: true,
syscap: "SystemCapability.Ability.AbilityBase"
]
@Derive[ToString, Equatable]
public enum Params  {
    PAGE_PATH

    @!APILevel[
    18,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): String 
}

@Annotation
public class APILevel {
    public const APILevel(let level: UInt8, let atomicservice!: Bool, let stagemodelonly!: Bool, let syscap!: String) {}
}