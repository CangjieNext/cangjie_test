// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package a

public struct RoArray<T> {
    public unsafe static func move() {
        RoArray<T>()
    }
}

private type BytesSlice = RoArray<Byte>

public interface BytesReader {
    func parseVarintData() {
        return unsafe { BytesSlice.move() }
    }
}
