package inc

private func foo(){
    return 1
}

public enum E<T> {
    R | G | B
    @Frozen
    public func f<U>(): Int64 {
        return foo()
    }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
