// $( function() {
//     var availableTags = [
//
//     ];
//   $( "#pokemon" ).autocomplete({
//     source: availableTags
//   });
// } );

$('#pkmnSearch').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

    $('.card').show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});
