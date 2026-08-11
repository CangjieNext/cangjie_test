// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: same mechanism as ideal_int_lambda_arg_prop.cj, but the expected
// type is carried by a function's declared return type and the target integer
// kind is Int16. Verifies the fix is independent of the carrying form
// (property vs. function return) and of the concrete integer kind.

// EXEC: %compiler %cmp_opt %f -o %output

class TypeTest<T> {
    init(a: T) {}
}

func make() : TypeTest<() -> Int16> {
    return TypeTest({=> 0})
}

main() {}
