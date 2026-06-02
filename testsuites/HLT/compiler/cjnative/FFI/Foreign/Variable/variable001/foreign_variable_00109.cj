/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output



public foreign var a: Int64 = 1 
public foreign let b: Int64 = 1 

foreign {
public var c: Int64 = 1 
public let d: Int64 = 1 
}
// ASSERT: scan parse_conflict_modifier
