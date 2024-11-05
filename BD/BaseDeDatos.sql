/* DROP database IF EXISTS papeleria; */
Create database papeleria;
use papeleria;
CREATE TABLE factura_pedido (
    ID_factura_pedido int(11) NOT NULL,
    fecha_pedido date DEFAULT NULL,
    correo varchar(100) DEFAULT NULL,
    metodo_pago varchar(50) DEFAULT NULL,
    costo decimal(10, 2) DEFAULT NULL,
    impuesto decimal(10, 2) DEFAULT NULL,
    descuento decimal(10, 2) DEFAULT NULL,
    costo_total decimal(10, 2) DEFAULT NULL,
    cedula varchar(20) DEFAULT NULL,
    PRIMARY KEY (ID_factura_pedido)
);
CREATE TABLE log_papeleria (
    id_auditoria INT AUTO_INCREMENT,
    tabla_afectada VARCHAR(100),
    operacion VARCHAR(10),
    id_registro INT,
    valor_anterior TEXT,
    valor_nuevo TEXT,
    usuario VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_auditoria)
);
CREATE TABLE pedidos_producto (
    ID_pedidos_producto int(11) NOT NULL,
    ID_factura_pedido int(11) DEFAULT NULL,
    codigo_barras varchar(20) DEFAULT NULL,
    cantidad int(11) DEFAULT NULL,
    estado varchar(50) DEFAULT NULL,
    PRIMARY KEY (ID_pedidos_producto)
);
CREATE TABLE producto (
    codigo_barras varchar(20) NOT NULL,
    nombre varchar(20) NOT NULL,
    stock int(11) NOT NULL,
    descripcion text NOT NULL,
    precio decimal(10, 2) NOT NULL,
    tipo varchar(50) NOT NULL,
    promocion varchar(50) NOT NULL,
    PRIMARY KEY(codigo_barras)
);
CREATE TABLE usuario (
    cedula varchar(20) NOT NULL,
    nombre varchar(100) NOT NULL,
    correo varchar(50) NOT NULL,
    contraseña varchar(8) NOT NULL,
    celular varchar(10) DEFAULT NULL,
    direccion varchar(20) DEFAULT NULL,
    rol varchar(15) NOT NULL,
    PRIMARY KEY(cedula)
);
