DELIMITER $$
CREATE PROCEDURE `buscarProductosPorNombre`(
    IN nombre_producto VARCHAR(50),
    OUT error INT
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE prod_nombre VARCHAR(20);
    DECLARE prod_stock INT;
    DECLARE prod_precio DECIMAL(10, 2);

    -- Declarar el cursor
    DECLARE cur_producto CURSOR FOR 
        SELECT nombre, stock, precio FROM producto WHERE nombre = nombre_producto;

    -- Declarar un manejador para el cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET error = 1;
        ROLLBACK;
    END;


    -- Crear una tabla temporal para almacenar los resultados
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_productos (
        nombre VARCHAR(20),
        stock INT,
        precio DECIMAL(10, 2)
    );

    START TRANSACTION;
    
    -- Abrir el cursor
    OPEN cur_producto;

    -- Leer los resultados del cursor
    read_loop: LOOP
        FETCH cur_producto INTO prod_nombre, prod_stock, prod_precio;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insertar los resultados en la tabla temporal
        INSERT INTO temp_productos (nombre, stock, precio)
        VALUES (prod_nombre, prod_stock, prod_precio);
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur_producto;

    -- Seleccionar los resultados de la tabla temporal
    SELECT * FROM temp_productos;

    -- Limpiar la tabla temporal (opcional)
    DROP TEMPORARY TABLE IF EXISTS temp_productos;

    SET error = 0; 
    COMMIT;
END$$
DELIMITER ;