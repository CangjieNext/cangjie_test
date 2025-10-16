/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@HttpApi[HttpObservable <: Observable]
interface HttpApi {
    @Post["api/msg/verification/send"]
    func sendAuthCode(
        n!: Int64 = @sourceLine(),
        @Field mobile: String,
        @Field["type"] codeTye: AuthCodeType
    ): Observable<HttpResult<Bool>>
}
