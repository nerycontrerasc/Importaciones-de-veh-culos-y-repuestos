/*

 * ER/Studio 8.0 SQL Code Generation

 * Company :      Microsoft

 * Project :      PROYECTO FINAL.DM1

 * Author :       Microsoft

 *

 * Date Created : Saturday, May 29, 2021 18:03:44

 * Target DBMS : Microsoft SQL Server 2008

 */



/* 

 * TABLE: ARTICULO 

 */



CREATE TABLE ARTICULO(

    ID_ARTICULO        numeric(10, 0)    NOT NULL,

    ID_TRACKING        numeric(10, 0)    NOT NULL,

    CODIGO_PAIS        numeric(10, 0)    NOT NULL,

    TIPO_ARTICULO      varchar(1)        NULL,

    NOMBRE_ARTICULO    varchar(100)      NULL,

    ESTADO             bit               NULL,

    PRECIO_VENTA       numeric(10, 2)    NULL,

    PAIS_ORIGEN        varchar(100)      NULL,

    EXISTENCIA         numeric(10, 0)    NULL,

    ID_VEHICULO        numeric(10, 0)    NULL,

    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ID_ARTICULO, ID_TRACKING, CODIGO_PAIS)

)

go







IF OBJECT_ID('ARTICULO') IS NOT NULL

    PRINT '<<< CREATED TABLE ARTICULO >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE ARTICULO >>>'

go



/* 

 * TABLE: ARTICULO_PROVEEDOR 

 */



CREATE TABLE ARTICULO_PROVEEDOR(

    ID_PROVEEDOR    numeric(10, 0)    NOT NULL,

    ID_ARTICULO     numeric(10, 0)    NOT NULL,

    ID_TRACKING     numeric(10, 0)    NOT NULL,

    CODIGO_PAIS     numeric(10, 0)    NOT NULL,

    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (ID_PROVEEDOR, ID_ARTICULO, ID_TRACKING, CODIGO_PAIS)

)

go







IF OBJECT_ID('ARTICULO_PROVEEDOR') IS NOT NULL

    PRINT '<<< CREATED TABLE ARTICULO_PROVEEDOR >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE ARTICULO_PROVEEDOR >>>'

go



/* 

 * TABLE: DEPARTAMENTO 

 */



CREATE TABLE DEPARTAMENTO(

    ID_DEPARTAMENTO        numeric(10, 0)    NOT NULL,

    NOMBRE_DEPARTAMENTO    varchar(100)      NULL,

    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ID_DEPARTAMENTO)

)

go







IF OBJECT_ID('DEPARTAMENTO') IS NOT NULL

    PRINT '<<< CREATED TABLE DEPARTAMENTO >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DEPARTAMENTO >>>'

go



/* 

 * TABLE: EMBARQUE 

 */



CREATE TABLE EMBARQUE(

    ID_TRACKING         numeric(10, 0)    NOT NULL,

    CODIGO_PAIS         numeric(10, 0)    NOT NULL,

    CODIGO_PROVEEDOR    numeric(10, 0)    NULL,

    CANTIDAD_PIEZAS     numeric(10, 0)    NULL,

    FECHA_ENVIO         date              NULL,

    FECHA_RECEPCION     date              NULL,

    CODIGO_RECEPTOR     numeric(10, 0)    NULL,

    TIPO_EMBARQUE       varchar(100)      NULL,

    VALOR_ENBARQUE      numeric(10, 2)    NULL,

    TIPO_ARTICULO       varchar(1)        NULL,

    DPI_RECEPTOR        numeric(15, 0)    NULL,

    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ID_TRACKING, CODIGO_PAIS)

)

go







IF OBJECT_ID('EMBARQUE') IS NOT NULL

    PRINT '<<< CREATED TABLE EMBARQUE >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE EMBARQUE >>>'

go



/* 

 * TABLE: EMPLEADO 

 */



CREATE TABLE EMPLEADO(

    DPI                  numeric(15, 0)    NOT NULL,

    ID_DEPARTAMENTO      numeric(10, 0)    NULL,

    NOMBRES              varchar(150)      NULL,

    APELLIDOS            varchar(150)      NULL,

    PUESTO               varchar(150)      NULL,

    [E-MAIL]             varchar(150)      NULL,

    TELEFONO             numeric(15, 0)    NULL,

    [SUPERVISOR_(JEFE)]  varchar(150)      NULL,

    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (DPI)

)

go







IF OBJECT_ID('EMPLEADO') IS NOT NULL

    PRINT '<<< CREATED TABLE EMPLEADO >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE EMPLEADO >>>'

go



/* 

 * TABLE: PAIS 

 */



CREATE TABLE PAIS(

    CODIGO_PAIS    numeric(10, 0)    NOT NULL,

    CONTINENTE     varchar(100)      NULL,

    NOMBRE         varchar(100)      NULL,

    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (CODIGO_PAIS)

)

go







IF OBJECT_ID('PAIS') IS NOT NULL

    PRINT '<<< CREATED TABLE PAIS >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE PAIS >>>'

go



/* 

 * TABLE: PROVEEDOR 

 */



CREATE TABLE PROVEEDOR(

    ID_PROVEEDOR        numeric(10, 0)    NOT NULL,

    CODIGO_PAIS         numeric(10, 0)    NOT NULL,

    NOMBRE_PROVEEDOR    varchar(100)      NULL,

    [E-MAIL]            varchar(100)      NULL,

    TELEFONO            numeric(20, 0)    NULL,

    DIRECCION           varchar(100)      NULL,

    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ID_PROVEEDOR, CODIGO_PAIS)

)

go







IF OBJECT_ID('PROVEEDOR') IS NOT NULL

    PRINT '<<< CREATED TABLE PROVEEDOR >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE PROVEEDOR >>>'

go



/* 

 * TABLE: VEHICULO 

 */



CREATE TABLE VEHICULO(

    ID_VEHICULO      numeric(10, 0)    NOT NULL,

    FABRICANTE       varchar(100)      NULL,

    MOTOTR_CC        numeric(2, 1)     NULL,

    LINEA            varchar(100)      NULL,

    AÑO_MODELO       numeric(10, 0)    NULL,

    TONELAJE         numeric(10, 1)    NULL,

    TIPO_VEHICULO    varchar(10)       NULL,

    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (ID_VEHICULO)

)

go







IF OBJECT_ID('VEHICULO') IS NOT NULL

    PRINT '<<< CREATED TABLE VEHICULO >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE VEHICULO >>>'

go



/* 

 * TABLE: ARTICULO 

 */



ALTER TABLE ARTICULO ADD CONSTRAINT RefEMBARQUE3 

    FOREIGN KEY (ID_TRACKING, CODIGO_PAIS)

    REFERENCES EMBARQUE(ID_TRACKING, CODIGO_PAIS)

go



ALTER TABLE ARTICULO ADD CONSTRAINT RefVEHICULO14 

    FOREIGN KEY (ID_VEHICULO)

    REFERENCES VEHICULO(ID_VEHICULO)

go





/* 

 * TABLE: ARTICULO_PROVEEDOR 

 */



ALTER TABLE ARTICULO_PROVEEDOR ADD CONSTRAINT RefARTICULO2 

    FOREIGN KEY (ID_ARTICULO, ID_TRACKING, CODIGO_PAIS)

    REFERENCES ARTICULO(ID_ARTICULO, ID_TRACKING, CODIGO_PAIS)

go



ALTER TABLE ARTICULO_PROVEEDOR ADD CONSTRAINT RefPROVEEDOR1 

    FOREIGN KEY (ID_PROVEEDOR, CODIGO_PAIS)

    REFERENCES PROVEEDOR(ID_PROVEEDOR, CODIGO_PAIS)

go





/* 

 * TABLE: EMBARQUE 

 */



ALTER TABLE EMBARQUE ADD CONSTRAINT RefPAIS5 

    FOREIGN KEY (CODIGO_PAIS)

    REFERENCES PAIS(CODIGO_PAIS)

go



ALTER TABLE EMBARQUE ADD CONSTRAINT RefEMPLEADO15 

    FOREIGN KEY (DPI_RECEPTOR)

    REFERENCES EMPLEADO(DPI)

go





/* 

 * TABLE: EMPLEADO 

 */



ALTER TABLE EMPLEADO ADD CONSTRAINT RefDEPARTAMENTO4 

    FOREIGN KEY (ID_DEPARTAMENTO)

    REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)

go





/* 

 * TABLE: PROVEEDOR 

 */



ALTER TABLE PROVEEDOR ADD CONSTRAINT RefPAIS6 

    FOREIGN KEY (CODIGO_PAIS)

    REFERENCES PAIS(CODIGO_PAIS)

go





