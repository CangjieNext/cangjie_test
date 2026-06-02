// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %frontendCompiler %f %cmp_opt %compile_lib_opt 2>&1 | compare %f
public var localTimes: Array<Int> = []
public var transTimes: Array<Int> = []

func inferZoneIndex(): Int64 {
    var index = 3
    if (transTimes.size > 0) {
        for (zoneIndex in index..=0 : -1) {
            if (!localTimes[zoneIndex] > 3) {
                return zoneIndex
            }
        }
    }
    for (zoneIndex in 0..localTimes.size) {
        if (!localTimes[zoneIndex] > 3) {
            return zoneIndex
        }
    }
    0
}

// ASSERT: scan-not unreachable block
