/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public enum AnnotatedEnum {
    | @Dup @Dup A1
    | @CTag["hello"] A2(Int64)
    | A3
}
