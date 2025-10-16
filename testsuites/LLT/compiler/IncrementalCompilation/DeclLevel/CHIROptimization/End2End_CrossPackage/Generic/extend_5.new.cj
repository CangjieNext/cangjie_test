package inc

private func foo(){
    return 1
}

public class C<T> {
}

extend<T> C<T> {
    @Frozen
    public func f<U>(){
        return foo()
    }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
