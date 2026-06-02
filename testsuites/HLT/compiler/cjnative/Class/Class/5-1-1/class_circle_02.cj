/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Data {
    public var rec: Rec = Rec()
}

struct Rec {
    public let data: Data = Data()
}

main(): Int64 {
    Data()
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
