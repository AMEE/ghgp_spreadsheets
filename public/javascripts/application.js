// Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
// Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function renderLoadingGif(wrappedSet) {
  var template = $('.ajaxloader');
  wrappedSet.each(function(){
    $(this).html(template.clone().attr('class',null).css({display: 'inline'}));
  });
};

function tableRowBackgroundColor(rows,color) {
  $(rows).each(function() {
    cells$ = $(this).children("td");
    cells$.each(function(){
      $(this).css('background',color);
      children = $(this).children("select input");
      children.each(function(){
        $(this).css('background',color);
      });
    });
  });
}

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

  $(".form table select, .form table input").css('background-color', '#f1f9f9');
  tableRowBackgroundColor($("#user_table tr:odd"), 'White');
  tableRowBackgroundColor($("#user_table tr:even"), '#f1f9f9');
});
