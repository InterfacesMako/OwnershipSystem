$(document).ready(function(){

	/*  Show/Hidden Submenus */
	$('.nav-btn-submenu').on('click', function(e){
		e.preventDefault();
		var SubMenu=$(this).next('ul');
		var iconBtn=$(this).children('.fa-chevron-down');
		if(SubMenu.hasClass('show-nav-lateral-submenu')){
			$(this).removeClass('active');
			iconBtn.removeClass('fa-rotate-180');
			SubMenu.removeClass('show-nav-lateral-submenu');
		}else{
			$(this).addClass('active');
			iconBtn.addClass('fa-rotate-180');
			SubMenu.addClass('show-nav-lateral-submenu');
		}
	});

	/*  Show/Hidden Nav Lateral */
	$('.show-nav-lateral').on('click', function(e){
		e.preventDefault();
		var NavLateral=$('.nav-lateral');
		var PageConten=$('.page-content');
		if(NavLateral.hasClass('active')){
			NavLateral.removeClass('active');
			PageConten.removeClass('active');
		}else{
			NavLateral.addClass('active');
			PageConten.addClass('active');
		}
	});

	/*  Exit system buttom */
	$('.btn-exit-system').on('click', function(e){
		e.preventDefault();
		Swal.fire({
			title: 'Are you sure to close the session?',
			text: "You are about to close the session and exit the system",
			type: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes, exit!',
			cancelButtonText: 'No, cancel'
		}).then((result) => {
			if (result.value) {
				window.location="Login";
			}
		});
	});

	window.setInterval(() => {
		$.ajax({
			type: "POST",
			url: controlSession,
			data: {},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: true,
			success: VerifySessionState,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus + ": " + XMLHttpRequest.responseText);
			}
		});
	}, (1000 * 60 * 1));
});
(function($){
    $(window).on("load",function(){
        $(".nav-lateral-content").mCustomScrollbar({
        	theme:"light-thin",
        	scrollbarPosition: "inside",
        	autoHideScrollbar: true,
        	scrollButtons: {enable: true}
        });
        $(".page-content").mCustomScrollbar({
        	theme:"dark-thin",
        	scrollbarPosition: "inside",
        	autoHideScrollbar: true,
        	scrollButtons: {enable: true}
        });
    });
})(jQuery);

function VerifySessionState(result) {
	if (result.d) {
		Swal.fire({
			title: 'Sesion Vencida',
			text: "La session se ha vencido! ¿desea continuar?",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#F44336',
			cancelButtonColor: '#03A9F4',
			confirmButtonText: '<i class="zmdi zmdi-run"></i> Salir de la sesion',
			cancelButtonText: '<i class="zmdi zmdi-close-circle"></i> Continuar dentro'
		}).then((result) => {
			if (result.value) {
				window.location = "Login";
			}
		});
	}
	else {
		Swal.fire({
			title: 'Error',
			text: "Se ha vencido la sesion y no se ha podido recuperar",
			type: 'error',
			confirmButtonColor: '#F44336',
			confirmButtonText: '<i class="zmdi zmdi-run"></i> Aceptar y Salir',
		}).then(function () {
			window.location.href = "Login.aspx";
		});
	}
}