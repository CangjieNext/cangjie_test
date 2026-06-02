/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign func a(): Unit

foreign class b {}

foreign interface c {}

foreign {
    func d(): Unit

    class e {}

    interface f {}
}

func a() {}

func d() {}

class b {}

class e {}

interface c {}

interface f {}
// ASSERT: scan sema_unexpected_wrapper
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_redefinition
