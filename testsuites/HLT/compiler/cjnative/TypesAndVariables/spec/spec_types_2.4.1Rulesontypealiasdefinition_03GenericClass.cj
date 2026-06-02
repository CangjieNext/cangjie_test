/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class GenericClassA<T, V> {}

class GenericClassB<T, V> {}

type Class1<V> = GenericClassA<Int64, V> // ok. ClassA is a generic class

type Class2<Value, V> = GenericClassB<Int64, V>

type Int<T> = Int32

main() {
    return 0
}
