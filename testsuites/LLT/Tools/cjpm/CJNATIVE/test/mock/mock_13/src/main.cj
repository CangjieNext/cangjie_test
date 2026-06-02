// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.runtime.*

main() {}

public func getCpus(): Int64 {
    let size: Int64 = ProcessorInfo.processorCount
    if (size <= 0) {
        // Faied to get cpu size, so it is set as the default value '8'
        return 8
    }
    return size
}

class ParallaToMock {
    public func calculateParallel(currentParalla: Int64): Int64 {
        var thisParallelSize = currentParalla
        let totalParallelSize = getCpus()

        if (thisParallelSize <= 2) {
            return totalParallelSize
        } else {
            return 2 * totalParallelSize / thisParallelSize
        }
    }
}
