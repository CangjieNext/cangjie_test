/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
public var public: Int64 = 1
public var private: Int64 = 1
public var redef: Int64 = 1
public var abstract: Int64 = 1
public var override: Int64 = 1
public var protected: Int64 = 1

public func open(redef: Int64, private!: Int64 = protected) {
    return redef + private - 2
}

main() {
    return open(redef, private: private) + open(redef)
}
