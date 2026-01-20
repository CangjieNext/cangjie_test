// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { os.ohos }
package simple_ui 

import sensor_mp.sensorcall
import cj_res.AppRCall

public platform func indexcall(): Unit {
	println("indexOhos")
	AppRCall()
	sensorcall()
}
