
jQuery(document).on('click','#commit',function(e){
  e.preventDefault();
  var entered_url = jQuery('#url').val();
  jQuery.ajax({
    url: "shrink_url",
    data: {"url": encodeURI(entered_url)},
    type: "PUT",
    success: function(result) {
      jQuery('[name=shortened_url]').removeClass("error");

      jQuery('[name=shortened_url]').addClass("result");
      jQuery('[name=shortened_url]').text(window.location.href +  result["shortened_url"]);
    },
    error: function(result, textStatus, errorThrown) {
      jQuery('[name=shortened_url]').addClass("error");
      jQuery('[name=shortened_url]').removeClass("result");
      jQuery('[name=shortened_url]').text(result.responseJSON["errors"]);
    },
  });
});
