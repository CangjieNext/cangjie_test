/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A
-(instancetype)foo1;
-(instancetype)foo2;
-(instancetype)foo3:(int)x;
-(instancetype)foo4:(int)x;
-(instancetype)init1;
-(instancetype)init2;
-(instancetype)init3:(int)x;
-(instancetype)init4:(int)x;
-(instancetype)init5 __attribute__((objc_method_family(none)));
-(instancetype)init6 __attribute__((objc_method_family(none)));
-(instancetype)init7:(int)x __attribute__((objc_method_family(none)));
-(instancetype)init8:(int)x __attribute__((objc_method_family(none)));
-(instancetype)foo5 __attribute__((objc_method_family(init)));
-(instancetype)foo6 __attribute__((objc_method_family(init)));
-(instancetype)foo7:(int)x __attribute__((objc_method_family(init)));
-(instancetype)foo8:(int)x __attribute__((objc_method_family(init)));
@end

@interface M : A
-(instancetype)foo1;
-(instancetype)foo2;
-(instancetype)foo3:(int)x;
-(instancetype)foo4:(int)x;
-(instancetype)init1;
-(instancetype)init2;
-(instancetype)init3:(int)x;
-(instancetype)init4:(int)x;
-(instancetype)init5;
-(instancetype)init6;
-(instancetype)init7:(int)x;
-(instancetype)init8:(int)x;
-(instancetype)foo5;
-(instancetype)foo6;
-(instancetype)foo7:(int)x;
-(instancetype)foo8:(int)x;
@end
