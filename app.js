$(document).ready(function() {
    // Cargar los datos cuando se cargue la página
    $.ajax({
        url: 'cargar_datos.php',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var regiones = data.regiones;
            var candidatos = data.candidatos;

            // Cargar regiones
            $.each(regiones, function(index, region) {
                $('#region').append('<option value="' + region.id + '">' + region.nombre + '</option>');
            });

            // Cargar candidatos
            $.each(candidatos, function(index, candidato) {
                $('#candidato').append('<option value="' + candidato.id + '">' + candidato.nombre + '</option>');
            });

            // Cambio de región
            $('#region').change(function() {
                var regionId = $(this).val();
                $('#comuna').empty();
                $('#comuna').append('<option value="" disabled selected>Seleccione una comuna</option>');

                $.each(regiones, function(index, region) {
                    if (region.id == regionId) {
                        $.each(region.comunas, function(index, comuna) {
                            $('#comuna').append('<option value="' + comuna.id + '">' + comuna.nombre + '</option>');
                        });
                    }
                });
            });
        },
        error: function(xhr, status, error) {
            console.error("Error al cargar datos: " + status + " - " + error);
        }
    });

    // Validación del formulario
    $('#votacion-form').submit(function(event) {
        event.preventDefault();
        var valid = true;
        var errorMessage = '';

        // Validar Alias
        var alias = $('#alias').val();
        var aliasRegex = /^[a-zA-Z0-9]+$/;
        if (alias.length <= 5 || !aliasRegex.test(alias)) {
            valid = false;
            errorMessage += 'El alias debe tener más de 5 caracteres y contener solo letras y números.\n';
        }

        // Validar RUT
        var rut = $('#rut').val();
        if (!validateRUT(rut)) {
            valid = false;
            errorMessage += 'El RUT ingresado no es válido.\n';
        }

        // Validar Email
        var email = $('#email').val();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            valid = false;
            errorMessage += 'El correo electrónico no es válido.\n';
        }

        // Validar Checkbox
        var checkboxes = $('input[name="enterado[]"]:checked');
        if (checkboxes.length < 2) {
            valid = false;
            errorMessage += 'Debe seleccionar al menos dos opciones de cómo se enteró de nosotros.\n';
        }

        if (valid) {
            var formData = $(this).serialize();

            $.ajax({
                url: 'guardar_voto.php',
                method: 'POST',
                data: formData,
                success: function(response) {
                    alert(response);
                },
                error: function(xhr, status, error) {
                    console.error("Error al enviar el formulario: " + status + " - " + error);
                }
            });
        } else {
            alert(errorMessage);
        }
    });

    function validateRUT(rut) {
        // Eliminar puntos y guiones
        rut = rut.replace(/[.-]/g, '');
    
        // Asegurar que el RUT tenga al menos 2 caracteres
        if (rut.length < 2) {
            return false;
        }
    
        // Separar el cuerpo y el dígito verificador
        var cuerpo = rut.slice(0, -1);
        var dv = rut.slice(-1).toUpperCase();
    
        // Validar el cuerpo del RUT (solo números)
        if (!/^\d+$/.test(cuerpo)) {
            return false;
        }
    
        // Calcular el dígito verificador esperado
        var suma = 0;
        var multiplo = 2;
    
        // Iterar sobre el cuerpo del RUT desde el último dígito hacia el primero
        for (var i = cuerpo.length - 1; i >= 0; i--) {
            suma += multiplo * parseInt(cuerpo.charAt(i));
            multiplo = (multiplo === 7) ? 2 : multiplo + 1;
        }
    
        var dvEsperado = 11 - (suma % 11);
        if (dvEsperado === 11) {
            dvEsperado = '0';
        } else if (dvEsperado === 10) {
            dvEsperado = 'K';
        } else {
            dvEsperado = dvEsperado.toString();
        }
    
        // Comparar el dígito verificador ingresado con el esperado
        return dv === dvEsperado;
    }
});