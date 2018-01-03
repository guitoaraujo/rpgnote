
$(function(){
   $('form.create-note .btn-save').click(function(){
      $(this).html('salvando...')
   });

   $('form.create-note').on('ajax:success', function(){
       $('form.create-note .btn-save').name('salvar notas')
       window.location.reload()
   });

   $('button#edit-note').click(function(){
       var name    = $(this).closest('tr').find('td:eq(0)').html();
       var content = $(this).closest('tr').find('td:eq(1)').html();

       $('input#note-name').html(name);
       $('textarea#note-content').html(content);

   });
});

