// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output

interface III<T> where T <: Int32 {}

enum EEE<T> where T <: Int32 {
    RED
}

struct SSS<U> where U <: Int32 {}

class CCC<X> where X <: Int32 {}

extend<T> CCC<T> where T <: Int32 {}

main() {}
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
