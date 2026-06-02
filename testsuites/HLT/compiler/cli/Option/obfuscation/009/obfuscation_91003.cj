/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: map
// ERRCHECK: %compiler %cmp_opt %obf_layout --obf-apply-mapping-file map/obf3.map %f -o %output
// ASSERT: scan LLVM ERROR: Duplicate symbol: default.test_default()

public var global_default: Int64= 1

public func test_default() {
}

main() {
    print(global_default)
    test_default()
    return 0
}
