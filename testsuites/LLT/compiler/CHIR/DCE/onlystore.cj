// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %compile_lib_opt 2>&1 | compare %f
// EXEC-PIPE: %compiler %f %compile_lib_opt -g 2>&1 | compare %f

public var COMMON_INFO = CommonInfo()

public class CommonInfo {
    public var inWorkspace = false
    public var singleModuleName = String()
}

func doBuild() {
    true
}

func foo() {
    let infoCache = COMMON_INFO
    COMMON_INFO = CommonInfo()
    if (!doBuild()) {
        return false
    }
    COMMON_INFO = infoCache
    true
}

main() {}
// ASSERT: scan-not unused variable
