// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

@Frozen
func foo<T>() {
    print(1)
}

public interface II<T> {
    func a() {}
}

public class A<T> <: II<T> {
    @Frozen
    public func a() {
        foo<T>()
    }
}
