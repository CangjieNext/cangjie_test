foreign func PassPointerToCangjie(): CPointer<Int32>
var a: CPointer<Int32> = unsafe { PassPointerToCangjie() }
var b: CPointer<Int32> = CPointer<Int32>(a)
main(){}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
