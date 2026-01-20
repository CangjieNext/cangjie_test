/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
    let v1 = Option<Bool>.Some(true)
    let v2 = Option<Bool>.None
    let r1 = v1 ?? false
    let r2 = v2 ?? false
    0
}
