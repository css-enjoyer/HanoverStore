/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  maxim
 * Created: May 5, 2023
 */

CREATE TABLE USERS 
    (USER_ID INT NOT NULL PRIMARY KEY 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    USER_NAME VARCHAR(100) NOT NULL,
    USER_PASSWORD VARCHAR(256) NOT NULL,
    USER_ROLE VARCHAR(10) NOT NULL);
