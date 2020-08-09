$(document).ready(function () {
    let endpointXmlText = 'http://localhost:8080/derivate'

    $('#calc').click(function (e) { 
        e.preventDefault();
        $('#output').val('');
        var content = $('#input').val()
        $.post(endpointXmlText, {xmlText:content},
            function (data, textStatus, jqXHR) {
              onSuccess(data)
            },
            "json"
        )
        .fail(onError)
        .always(al=>{
            console.log("DONE!")
        });

    });


    $('#closeAlert').click(function (e) { 
        e.preventDefault();
        $('#error-msg').fadeOut()
    });

    /**
     * Función en caso la peticion retorne un error
     */
    function onError(error){
        console.log("ERROR: ",error)
        $('#error-msg-content').html('Error ('+error.status+'): '+error.responseText);
        $('#error-msg').fadeIn()
    }

    /**
     * Función en caso la petición retorne con éxito la operació
     */
    function onSuccess(response){
        $('#output').val(response.derivate);
    }
});