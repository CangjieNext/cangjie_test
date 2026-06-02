/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum E {
    | AB
}

main() {
    var a: VArray<E, $1> = [AB]
    return 0
}
// ASSERT: scan sema_varray_arg_type_with_reftype
