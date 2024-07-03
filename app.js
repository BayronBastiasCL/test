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
            errorMessage += 'El RUT no es válido.\n';
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
        // Implementa la validación del RUT de Chile aquí
        // Esta es una función básica de validación de RUT
        // Puedes mejorarla según tus necesidades
        var rutRegex = /^[0-9]+-[0-9kK]{1}$/;
        return rutRegex.test(rut);
    }
});