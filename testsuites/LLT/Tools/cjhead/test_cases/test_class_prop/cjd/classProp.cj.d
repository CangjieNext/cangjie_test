package test.classProp



/**
 * Foo
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class Foo {
    /**
     * Foo::a
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var a = 0

    /**
     * Foo::b
     */
    public mut prop b: Int64

    /**
     * Foo::c
     */
    public var c = 0
}