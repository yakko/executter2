mention_username=false;

function make_colorbox() {
  $("a[rel='thumbnail']").colorbox({transition:"elastic", speed: 500});
}
function make_button() {
  $('.ui-button').button();
}
function mention(username) {
  $('#home-form-tabs textarea:visible').append(username+' ').focus();
}
function registerContextMenu() {
  var list = $("a.user[data-menucontext!=1]");
  if (list.length > 0) {
    menu = new ContextMenu();
    menu.addItem( "mention",
                  "Mention",
                  functions.application.cmenu.mention,
                  "/stylesheets/ContextMenu-Images/page_white_copy.png"
                  );
    menu.addItem( "redirect",
                  "Profile",
                  functions.application.cmenu.redirect,
                  "/stylesheets/ContextMenu-Images/paste_plain.png"
                  );
    $("a.user[data-menucontext!=1]").each(function() {
      menu.register($(this).attr('id'));
      $(this).attr('data-menucontext',1);
    });
  }
}

$(function() {

  $title1 = $("head title").html();
  $title2 = $title1;
  $title_at1 = true;
  
  setInterval(function() {
    t = ($title_at1) ? $title1 : $title2;
    $title_at1 = !$title_at1;
    $("head title").html(t);
  }, 1200);

  functions.application.ex2tabs.append_behaviour();
  functions.application.ajaxload.run();
  functions.application.search.append_behaviour();

  make_button();
  functions.application.css2.fix();
  registerContextMenu();

/*
  $('a.mention, a.username, a.user').live('click', function () {
    if (CONTROLLER=='home')
      mention($(this).html());
    else
      window.location='/?mention='+$(this).html();
    return false;
  });
*/
  

  $(".tabs").tabs().find("*").removeClass("ui-widget-header ui-corner-all");
  $('.restrict_name').keyup(function () { 
    for (var i=0; i<this.value.length; i++)
      this.value = this.value.replace(/([0-9\^<,@\/\{\}\(\)\*\$%\?=>:\|;#]+)/i,'');
  });
  $('.restrict_username').keyup(function () { 
    for (var i=0; i<this.value.length; i++)
      this.value = this.value.replace(/[^a-zA-Z0-9_-]/,'');
  });

  $("div.anchor").live('click', function() {
    window.location = $(this).attr('href');
    return false;
  });
  
});
