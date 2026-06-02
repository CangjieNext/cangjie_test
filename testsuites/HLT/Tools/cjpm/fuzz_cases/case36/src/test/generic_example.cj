/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// test/generic_example.cj
package GenericMacro.test

internal import GenericMacro.annotation.wrongMirror
internal import GenericMacro.annotation.wrongMirror2
internal import GenericMacro.annotation.correctMirror
internal import GenericMacro.annotation.correctMirror2

@correctMirror
public func returnSelf1<T>(variable: T): T {
    return variable
}

@wrongMirror
public func returnSelf2<T>(variable: T): T {
    return variable
}

@wrongMirror2
public func returnSelf3<T>(variable: T): T {
    return variable
}

@correctMirror2
public func returnSelf4<T>(variable: T): T {
    return variable
}
