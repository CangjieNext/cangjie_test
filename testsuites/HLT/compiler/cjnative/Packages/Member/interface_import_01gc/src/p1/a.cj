/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public interface WriteStream {
    func write(x: String): Int64 {
        write(x, 1)
    }
    func write(x: String, y: Int64): Int64
}

public interface StreamPermission {
    func canRead(): Bool {
        true
    }
}

public class Stream <: StreamPermission & WriteStream {
    public func write(x: String, y: Int64): Int64 {
        2
    }
}
