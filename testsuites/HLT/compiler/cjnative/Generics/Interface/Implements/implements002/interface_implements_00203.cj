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

public interface I<T> {}

public interface J<T> {}

public open class A<T> {}

public class B<T> <: A<T> & I<Int32> & J<Int32> {}

main() {
    var a: B<Int32> = B<Int32>()
    return 0
}
