// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let longpress = {
    evt: EventBase =>
        state.good = 1
        promptShowToast(
            ToastObj(
                message: "change 1!!!",
                duration: Some<Int64>(1000),
                gravity: Some<Gravity>(Gravity.center)
            )
        ) //ABC
}
let click = {
    evt: EventBase =>
        state.good = 0
        promptShowToast(
            ToastObj(
                message: "change 0!!!",
                duration: Some<Int64>(1000),
                gravity: Some<Gravity>(Gravity.center)
            )
        )
}
let test = {evt: EventBase => state.good = 0}

func test(): Unit {
    unsafe {
        {
            =>
                let stubCall = @EnsurePreparedToMock {=> return get_c_a()}
                ConfigureMock.stubFunction(stubCall, [], "get_c_a", "get_c_a", #"get_c_a()"#, 27)
        }().returns(1)
    }
}

main() {
    //abc
    spawn {
        var a = 1 //abc
        // abc
    }
}
