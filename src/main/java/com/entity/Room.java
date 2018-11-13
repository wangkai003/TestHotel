package com.entity;
import java.math.BigDecimal;
import java.util.Date;

public class Room {
    public Room() {

    }
    
    /*   */
    private Integer id;
    /*   */
    private String name;
    /*   */
    private BigDecimal price;
    /*   */
    private String category;
    /*   */
    private Integer status;
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getId() {
        return this.id;
    }
    public String getName() {
        return this.name;
    }
    public BigDecimal getPrice() {
        return this.price;
    }
    public String getCategory() {
        return this.category;
    }
    public Integer getStatus() {
        return this.status;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
}