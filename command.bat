@echo off
echo.
echo Creando usuario "Usuario1" y "Usuario2"
echo.
echo Creando Usuario "Usuario1"
:: Creamos el Usuario 1 y asignamos contraseña
net user Usuario1 Su*klr12 /add
:: Este comando edita las propiedades de la cuenta y deshabilita que la contraseña expire, para modificar cambie valor False a True
WMIC USERACCOUNT WHERE "Name='Usuario1'" Set PasswordExpires=False
:: Este comando edita las propiedades de la cuenta y deshabilita que el usuario pueda cambiar su propia contraseña, para modificar cambie valor False a True
WMIC USERACCOUNT WHERE "Name='Usuario1'" Set PasswordChangeable=False
:: net localgroup se usa para agregar el usuario a un grupo local, ejemplo Administradores
:: Si se va a usar comando para editar las propiedades de una cuenta como los 2 anteriores, es preferible dejar el comando de asignación de grupo local de ultimo, con el fin que no genere problema.
net localgroup Administrators Usuario1 /add
echo.
echo.
echo Creando Usuario "Usuario2"
net user Usuario2 Su*klr13 /add
WMIC USERACCOUNT WHERE "Name='Usuario2'" Set PasswordExpires=False
WMIC USERACCOUNT WHERE "Name='Usuario2'" Set PasswordChangeable=False
net localgroup Administrators Usuario2 /add
echo.
echo.
echo Presione una tecla para continuar.
echo pause>nul