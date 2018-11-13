package com.entity;
import java.util.Date;

public class HOrder {
    public HOrder() {

    }
    
    /*   */
    private Integer id;
    /*   */
    private Integer userid;
    /*   */
    private Integer roomid;
    /* 入驻天数  */
    private Integer day;
    /* 下单时间  */
    private Date time;

    private User user;

    private Room room;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Integer getId() {
        return this.id;
    }
    public Integer getUserid() {
        return this.userid;
    }
    public Integer getRoomid() {
        return this.roomid;
    }
    public Integer getDay() {
        return this.day;
    }
    public Date getTime() {
        return this.time;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public void setUserid(Integer userid) {
        this.userid = userid;
    }
    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }
    public void setDay(Integer day) {
        this.day = day;
    }
    public void setTime(Date time) {
        this.time = time;
    }
}