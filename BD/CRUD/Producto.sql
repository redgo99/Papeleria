-- CRUD productos

-- 1:Insertar

DELIMITER $$
DROP PROCEDURE IF EXISTS crearProducto $$ 
CREATE PROCEDURE crearProducto(
    IN Pbarras VARCHAR(20),
    IN Pnombre VARCHAR(20),
    IN Pstock VARCHAR(11),
    IN Pdescripcion TEXT,
    IN Pprecio DECIMAL(10,2),
    IN Ptipo VARCHAR(50),
    IN Ppromocion VARCHAR(50),
    OUT error INT
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        SET error = 1;
        ROLLBACK;
    END;
    
    START TRANSACTION;
        INSERT INTO producto (
                codigo_barras,
                nombre,
                stock,
                descripcion,
                precio,
                tipo,
                promocion
            )
        VALUES (
                Pbarras,
                Pnombre,
                Pstock,
                Pdescripcion,
                Pprecio,
                Ptipo,
                Ppromocion
            );
    SET error = 0;
    COMMIT;
END 
$$ 
DELIMITER ;

-- 2:Borrar

DELIMITER $$
DROP PROCEDURE IF EXISTS borrarProducto $$ 
CREATE PROCEDURE borrarProducto(
    IN Pbarras VARCHAR(20),
    OUT error INT
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        SET error = 1;
        ROLLBACK;
    END;
    
    START TRANSACTION;
        DELETE FROM producto
        WHERE codigo_barras = Pbarras;
    SET error = 0;
    COMMIT;
END 
$$ 
DELIMITER ;

-- 3:Actualizar

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarProducto $$ 
CREATE PROCEDURE actualizarProducto(
    IN Pbarras VARCHAR(20),
    IN Pnombre VARCHAR(20),
    IN Pstock VARCHAR(11),
    IN Pdescripcion TEXT,
    IN Pprecio DECIMAL(10,2),
    IN Ptipo VARCHAR(50),
    IN Ppromocion VARCHAR(50),
    OUT error INT
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        SET error = 1;
        ROLLBACK;
    END;
    
    START TRANSACTION;
        UPDATE producto
        SET codigo_barras = Pbarras,
                nombre = Pnombre,
                stock =  Pstock,
                descripcion =  Pdescripcion,
                precio =   Pprecio,
                tipo =   Ptipo,
                promocion = Ppromocion
        WHERE  codigo_barras = Pbarras;
    SET error = 0; 
    COMMIT;
END 
$$ 
DELIMITER ;