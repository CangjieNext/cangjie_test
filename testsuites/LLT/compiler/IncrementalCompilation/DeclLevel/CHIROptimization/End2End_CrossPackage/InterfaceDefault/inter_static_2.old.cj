package inc

private func foo(){
    0
}

public interface I{
    @Frozen
    static func f():Int64 {
        return foo()
    }
}

public class C <: I{

}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
