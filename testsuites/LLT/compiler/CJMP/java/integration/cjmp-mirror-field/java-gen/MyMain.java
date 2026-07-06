package pkgcj;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class MyMain {
    static {
        loadLibrary("demo");
    }

    long self;

    public MyMain() {
        super();
        self = initCJObject();
    }

    private MyMain($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

    public static void main(String[] args) {
        mainCN9java_lang6JArrayICN9java_lang7JStringEE(args);
    }

    public static native void mainCN9java_lang6JArrayICN9java_lang7JStringEE(String[] args);

    @Override
    public boolean equals(Object obj) {
        throw new UnsupportedOperationException("equals is not supported for java proxy object.");
    }

    @Override
    public int hashCode() {
        throw new UnsupportedOperationException("hashCode is not supported for java proxy object.");
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("toString is not supported for java proxy object.");
    }

    public native void deleteCJObject(long self);

    @Override
    public void finalize() {
        deleteCJObject(this.self);
    }
}
