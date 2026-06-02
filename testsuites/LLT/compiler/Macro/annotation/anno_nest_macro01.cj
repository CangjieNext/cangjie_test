// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output

import define.*

@Annotation[target: [MemberFunction, Type]]
public class BeanMeta {
    public const BeanMeta(
        public let name!: String = '',
        public let lazy!: Bool = true,
        public let order!: Int64 = 0,
        public let primary!: Bool = false,
    ) {}
}

@BeanMeta[name: 'currentUserController']
@WeavedController
public class CurrentUserController {}

main() {}