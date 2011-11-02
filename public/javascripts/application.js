// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function renderLoadingGif(wrappedSet) {
  var template = $('.ajaxloader');
  wrappedSet.each(function(){
    $(this).html(template.clone().attr('class',null).css({display: 'inline'}));
  });
};

$(document).ready(function(){
  $('#contentarea').hide().fadeIn('slow');

  $("input[type='submit']").live('mouseover', function() {
    $(this).css('cursor','pointer');
   },function() {
    $(this).css('cursor','auto');
  });

  $('.form table tr:first td').css('border-top', '1px dashed LightGray');
  $('.form table tr').each(function() {
    $(this).children('td:last').css('border-right', '1px dashed LightGray');
  });
});
