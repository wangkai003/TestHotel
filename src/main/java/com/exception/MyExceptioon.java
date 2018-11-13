package com.exception;

public class MyExceptioon extends RuntimeException {
    private Integer code;

    public MyExceptioon(String message) {
        super(message);
        this.code = 500;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
