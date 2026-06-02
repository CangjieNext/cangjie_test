/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class Data {
    public var data : Int32 = 2
    public init(x: Int32){
        this.data = match (x) {
            case 60 => this.data+1
            case g@ 70 => g1@+1 
            case  _ => 0
        }
    }
}

main(): Int64 {
    var dt = Data(70)
    if (dt.data == 71) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_expected_double_arrow_in_case
// ASSERT: scan parse_expected_character
