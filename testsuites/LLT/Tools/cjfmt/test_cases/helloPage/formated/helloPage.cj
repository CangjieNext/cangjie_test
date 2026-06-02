// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import UI.Foundation.*
internal import UI.Components.*
internal import UI.Systemlib.*
internal import UI.Styles.*
internal import UI.Common.*

// 状态类，用于存放运行时的数据
class HelloState <: State {
    // 定义一个可变变量name，用于保存用户输入
    var name: String

    // 定义一个可变变量displayName，用于显示用户输入
    var displayName: String

    // 构造函数，实例化对象时调用
    init(name: String, displayName: String) {
        this.name = name
        this.displayName = displayName
    }
}

// 页面定义
class HelloPage <: Component {
    // 定义一个名为 state 的成员变量
    let state = HelloState("", "")

    // update函数，将state中的name更新为Input组件接收的值
    func update(evt: OnChangeInputParam) {
        this.state.name = evt.value
    }

    // nameDisplay函数，用于显示存储的值
    func nameDisplay(evt: EventBase) {
        this.state.displayName = this.state.name
    }

    // 页面跳转函数
    func goPage(pageUri: String) {
        let myRouter = RouterPushObj(
            // uri必填，表示要跳转到的uri
            uri: pageUri,
            // 跳转时需要传递的数据
            params: ParamsObj(PARAM_LAUNCH_FLAG: None<String>)
        )

        // 跳转到应用的某个页面，括号里的参数时RouterPushObj类型
        routerPush(myRouter)
    }

    /* 页面渲染函数，由 App().run() 调起，返回一个 UI 结构
     * SwanUI 中，函数最后的表达式会隐式返回
     * 页面的 UI 需要在该函数中定义 */
    func render() {
        let textStyle1 = TextStyle(
            // 字体大小
            fontSize: Some(50.px()),
            // 字体颜色
            color: Some(Color(Colors.darkblue))
        )
        let textStyle2 = textStyle1.blend(TextStyle(color: Some(Color(Colors.rgb(0x696969)))))
        let textStyle3 = TextStyle(
            width: Some(90.percent()),
            fontSize: Some(40.px()),
            color: Some(Color(Colors.gray)),
            // 设置文本右对齐
            textAlign: Some(TextAlign.right)
        )
        let imageStyle1 = ImageStyle(
            // 图片宽度
            width: Some(150.px()),
            // 图片外边距
            margin: Some([100.px(), 100.px(), 100.px(), 100.px()])
        )
        let inputStyle1 = InputStyle(
            // 输入框宽度
            width: Some(90.percent()),
            // 输入框高度
            height: Some(80.px()),
            // 输入框外边距（上右下左）
            margin: Some([50.px(), 10.px(), 30.px(), 10.px()]),
            // 输入框边框宽度（上右下左），这里表示只有下边框
            borderWidth: Some([0.px(), 0.px(), 1.px(), 0.px()]),
            // 输入框边框颜色（上右下左）
            borderColor: Some(Color[0](4, Color(Colors.rgba(0x7788997d)))),
            // 文本颜色
            color: Some(Color(0, 0, 0)),
            // 文本大小
            fontSize: Some(38.px()),
            // 提示文本的颜色
            placeholderColor: Some(Color(119, 136, 153, alpha: 0.5)),
            // 光标颜色
            caretColor: Some(CaretColor.custom(Some(Color(Colors.dimgrey))))
        )
        let inputStyle2 = InputStyle(
            width: Some(90.percent()),
            height: Some(80.px()),
            margin: Some([10.px(), 10.px(), 10.px(), 10.px()]),
            // 输入框背景颜色
            backgroundColor: Some(Color(144, 202, 249)),
            color: Some(Color(Colors.white))
        )
        let divStyle1 = DivStyle(
            // 布局方向
            flexDirection: Some(FlexDirection.column),
            // 交叉轴对齐方式
            alignItems: Some(AlignItems.center)
        )

        // 布局组件
        Div(
            // 布局内容
            content: [
                // 文本组件
                Text(
                    // 文本内容
                    content: "Hello, this is a test demo.",
                    // 文本样式
                    style: Some(textStyle1)
                ),
                // 图片组件
                Image(
                    // 图片地址
                    src: "/common/logo.png",
                    // 图片样式
                    style: Some(imageStyle1)
                ),
                Text(
                    content: bind({=> "Welcome ${state.displayName}"}),
                    style: Some(textStyle2)
                ),
                // 输入组件
                Input(
                    // 输入框类型文本
                    inputType: Some(InputType.text),
                    // 提示文本
                    placeholder: Some("Enter your name"),
                    // 输入样式
                    style: Some(inputStyle1),
                    onChange: update
                ),
                Input(
                    // 输入框类型按钮
                    inputType: Some(InputType.button),
                    // 显示文本
                    value: Some("login"),
                    style: Some(inputStyle2),
                    onClick: nameDisplay
                ),
                Text(
                    content: "Enter",
                    style: Some(textStyle3),
                    onClick: {evt => goPage("newPage")}
                )
            ],
            // 布局样式
            style: Some(divStyle1)
        )
    }
}

@preview
public func mySwanUIPreview() {
    HelloPage()
}
