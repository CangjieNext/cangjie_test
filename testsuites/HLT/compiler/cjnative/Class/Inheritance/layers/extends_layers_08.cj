/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



open class Base3 {
    public interface I3 { 
        let b = 3
    }
}

open class Base2 <: Base3 {
    public interface I2 { 
        let b = 2
    }
}

class Data <: Base2 {
  public interface I1 { 
        let b = 1
    }
}

main(): Int64 {
    var obj = Data()
    var res : Int64 = Data.I1.b
    if (res != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
