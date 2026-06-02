/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend Int8 {
    operator func [](arg1: Int8, value!: Int8): Unit {
    }
}

extend Int16 {
    operator func [](arg1: Int16, value!: Int16): Unit {
    }
}

extend Int32 {
    operator func [](arg1: Int32, value!: Int32): Unit {
    }
}

extend Int64 {
    operator func [](arg1: Int64, value!: Int64): Unit {
    }
}

extend UInt8 {
    operator func [](arg1: UInt8, value!: UInt8): Unit {
    }
}

extend UInt16 {
    operator func [](arg1: UInt16, value!: UInt16): Unit {
    }
}

extend UInt32 {
    operator func [](arg1: UInt32, value!: UInt32): Unit {
    }
}

extend UInt64 {
    operator func [](arg1: UInt64, value!: UInt64): Unit {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_immutable_type_extend_assignment_index_operator
