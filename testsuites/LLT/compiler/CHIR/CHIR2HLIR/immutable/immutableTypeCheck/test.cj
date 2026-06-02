// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %compile_lib_opt %f %diag_json
extend Int64 {
    public operator func [](index: Int64, value!: Bool) {
    }
}

extend Int64 {
    public mut prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

extend<T> Range<T> where T <: Countable<T> & Comparable & Equatable {
    public mut prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

extend String {
    public mut prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}
// ASSERT: scan sema_invalid_mut_modifier_extend_of_struct
// ASSERT: scan sema_generic_type_without_type_argument
// ASSERT: scan sema_immutable_type_extend_assignment_index_operator
// ASSERT: scan sema_immutable_type_illegal_property
