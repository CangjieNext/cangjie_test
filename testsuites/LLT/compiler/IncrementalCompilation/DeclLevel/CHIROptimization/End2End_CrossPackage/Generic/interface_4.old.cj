package inc

@Frozen
private func foo(){
    return 0
}

public interface I<T> {
    @Frozen
    func f(): Int64 {
        return foo()
    }
}

public class C<T> <: I<T> {}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
