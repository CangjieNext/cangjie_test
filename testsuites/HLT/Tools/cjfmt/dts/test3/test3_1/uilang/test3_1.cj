/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@HttpApi[HttpObservable <: Observable]
interface    HttpApi{
 
    @Post["api/msg/verification/send"]
    func sendAuthCode(@Field mobile:String, @Field["type"] codeTye:AuthCodeType): Observable<HttpResult<Bool>>
 
    @Post["api/msg/verification"]
    func verifyAuthCode(@Field mobile:String, @Field code:String, @Field["type"] codeTye:AuthCodeType): Observable<HttpResult<Bool>>
 
    @Post["api/consumer/login/userLogin"]
    func login(@Query mobile:String, @Query loginType:loginType, @Query["code"] authCode:String, @Query password:String): Observable<HttpResult<String>>
}