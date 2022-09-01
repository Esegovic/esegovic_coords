window.addEventListener('message', function(event) {
   let data = event.data;
   switch (data.event) {
       case 'show':
         $("#vector3").html(data.vector3);
         $("#vector4").html(data.vector4);
         $("#xyz").html(data.xyz);
         $("#array-xyz").html(data.array_xyz);
         $("#heading").html(data.heading);
         $("body").show();
         break;

       case 'hide':
         $("body").hide();
         break;
   }
});

$(document).keyup(function(e) {
   if (e.key === "Escape") {
      $.post('http://esegovic_coords/exit', JSON.stringify({}))
  }
});

$("#_vector3").click(function(){
   copyToClipboard($("#vector3").html())
})
$("#_vector4").click(function(){
   copyToClipboard($("#vector4").html())
})
$("#_xyz").click(function(){
   copyToClipboard($("#xyz").html())
})
$("#_array-xyz").click(function(){
   copyToClipboard($("#array-xyz").html())
})
$("#_heading").click(function(){
   copyToClipboard($("#heading").html())
})

const copyToClipboard = str => {
   const el = document.createElement('textarea');
   el.value = str;
   document.body.appendChild(el);
   el.select();
   document.execCommand('copy');
   document.body.removeChild(el);
   $('#message').css('display', 'flex');
   setTimeout(() => {
      $("#message").fadeOut();
   }, 3000);
};