CREATE TABLE REGIONS (
    REGION_ID NUMBER PRIMARY KEY,
    REGION_NAME VARCHAR2(25)
);

CREATE TABLE COUNTRIES (
    COUNTRY_ID CHAR(2) PRIMARY KEY,
    COUNTRY_NAME VARCHAR2(40),
    REGION_ID NUMBER,
    FOREIGN KEY (REGION_ID) REFERENCES REGIONS(REGION_ID)
);

CREATE TABLE LOCATIONS (
    LOCATION_ID NUMBER PRIMARY KEY,
    STREET_ADDRESS VARCHAR2(40),
    POSTAL_CODE VARCHAR2(12),
    CITY VARCHAR2(30),
    STATE_PROVINCE VARCHAR2(25),
    COUNTRY_ID CHAR(2),
    FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID)
);

CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID NUMBER PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR2(30),
    MANAGER_ID NUMBER,
    LOCATION_ID NUMBER,
    FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID)
);

CREATE TABLE JOBS (
    JOB_ID VARCHAR2(10) PRIMARY KEY,
    JOB_TITLE VARCHAR2(35),
    MIN_SALARY NUMBER,
    MAX_SALARY NUMBER
);

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(25),
    EMAIL VARCHAR2(25) UNIQUE,
    PHONE_NUMBER VARCHAR2(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR2(10),
    SALARY NUMBER(8,2),
    COMMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER,
    DEPARTMENT_ID NUMBER,
    FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

CREATE TABLE JOB_HISTORY (
    EMPLOYEE_ID NUMBER,
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID VARCHAR2(10),
    DEPARTMENT_ID NUMBER,
    PRIMARY KEY (EMPLOYEE_ID, START_DATE),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID),
    FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

INSERT INTO REGIONS VALUES (1, 'North America');
INSERT INTO REGIONS VALUES (2, 'Europe');
INSERT INTO REGIONS VALUES (3, 'Asia');

INSERT INTO COUNTRIES VALUES ('US', 'United States', 1);
INSERT INTO COUNTRIES VALUES ('DE', 'Germany', 2);
INSERT INTO COUNTRIES VALUES ('JP', 'Japan', 3);

INSERT INTO LOCATIONS VALUES (1000, '123 Main St', '12345', 'New York', 'NY', 'US');
INSERT INTO LOCATIONS VALUES (2000, '456 Elm St', '67890', 'Berlin', 'BE', 'DE');
INSERT INTO LOCATIONS VALUES (3000, '789 Sakura St', '54321', 'Tokyo', 'TY', 'JP');

INSERT INTO DEPARTMENTS VALUES (10, 'IT', NULL, 1000);
INSERT INTO DEPARTMENTS VALUES (20, 'HR', NULL, 2000);
INSERT INTO DEPARTMENTS VALUES (30, 'Finance', NULL, 3000);

INSERT INTO JOBS VALUES ('DEV', 'Developer', 4000, 9000);
INSERT INTO JOBS VALUES ('HRM', 'HR Manager', 5000, 10000);
INSERT INTO JOBS VALUES ('FIN', 'Financial Analyst', 4500, 9500);

INSERT INTO EMPLOYEES VALUES (1, 'John', 'Doe', 'jdoe@example.com', '123-4567', SYSDATE, 'DEV', 5000, NULL, NULL, 10);
INSERT INTO EMPLOYEES VALUES (2, 'Jane', 'Smith', 'jsmith@example.com', '987-6543', SYSDATE, 'HRM', 6000, NULL, NULL, 20);
INSERT INTO EMPLOYEES VALUES (3, 'Ken', 'Tanaka', 'ktanaka@example.com', '567-8901', SYSDATE, 'FIN', 5500, NULL, NULL, 30);

INSERT INTO JOB_HISTORY VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'DEV', 10);
INSERT INTO JOB_HISTORY VALUES (2, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'HRM', 20);
INSERT INTO JOB_HISTORY VALUES (3, TO_DATE('2021-03-15', 'YYYY-MM-DD'), TO_DATE('2022-03-15', 'YYYY-MM-DD'), 'FIN', 30);

COMMIT;