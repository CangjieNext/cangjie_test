// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package lib

public class C {}

public interface IRoot {
    func foo(): String {
        ""
    }
}

public interface ISub <: IRoot {}

extend C <: IRoot {}

extend C <: ISub {}
