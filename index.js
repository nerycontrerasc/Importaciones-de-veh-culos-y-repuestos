const rest = new (require('rest-mssql-nodejs'))({
    user: 'sa',
    password: 'beadelcid33',
    server: 'DESKTOP-9RQE5US',
    database: 'sistema_ventas'
});

setTimeout(async() => {
    const resultado = await rest.executeQuery('SELECT * FROM pais WHERE nombre = @nombre;', [{
        name: 'nombre',
        type: 'varchar',
        value: 'guatemala'
    }]);
    console.log(resultado.data);
}, 100);

setTimeout(async() => {
    const resultado1 = await rest.executeQuery('SELECT * FROM pais WHERE nombre = @nombre;', [{
        name: 'nombre',
        type: 'varchar',
        value: 'guatemala'
    }]);
    console.log(resultado1.data);
}, 100);