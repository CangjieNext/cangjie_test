package demo.utils



// 提供一个公共的日志类
public class Logger {
    // 静态函数，方便直接调用
    public static func info(msg: String): Unit {
        println("[INFO] ${msg}")
    }

    public static func error(msg: String): Unit {
        println("[ERROR] *** ${msg} ***")
    }
}