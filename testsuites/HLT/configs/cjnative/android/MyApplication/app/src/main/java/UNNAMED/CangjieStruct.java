package UNNAMED;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class CangjieStruct {
    static {
        loadLibrary("UNNAMED");
    }

    long self;

    public CangjieStruct() {
        self = initCJObject();
    }

    private CangjieStruct($$NativeConstructorMarker __init__) {
    }

    public native long initCJObject();

    private CangjieStruct (long id, $$NativeConstructorMarker __init__) {
        self = id;
    }

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
