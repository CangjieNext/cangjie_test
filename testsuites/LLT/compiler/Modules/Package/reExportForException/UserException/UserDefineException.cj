// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package UserException

public import CJException.JavaExceptionSim

public open class UserExceptionExceptionImp <: JavaExceptionSim {
    public open override func say() {
        print("I am UserExceptionExceptionImp !\n")
    }
}
