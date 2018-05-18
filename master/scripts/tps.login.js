var tps = 
{
	login: function ()
	{
		var lh = document.body.clientHeight;
		var rh = $(document).height();
		$("body").css("margin-top", Math.floor(rh / 2) - lh + "px");
		$("#uid").focus();
		$("#submit").click(tps.enter);
	},
	enter: function ()
	{
		var uid = $("#uid").val();
		var pwd = $("#pwd").val();
		if (uid.length <= 0)
		{
			$("#msg").html("请填写正确的用户名").css("background", "url(skin/manage/images/err.gif) no-repeat 0 6px");
			$("#uid").focus();
			return false;
		}
		if (pwd.length <= 0)
		{
			$("#msg").html("请填写正确的密码").css("background", "url(skin/manage/images/err.gif) no-repeat 0 6px");
			$("#pwd").focus();
			return false;
		}
		$("#msg").html("请稍候...").css("background", "url(skin/manage/images/loading.gif) no-repeat 0 6px");
		$.getJSON("handle.php", { "m": "member","c":"login","uid": uid, "pwd": pwd,"tab":"master", "url": "admin.php?m=manage" }, function (xhr)
		{
			$("#msg").html(xhr.tip).css("background", xhr.skin);			
			if (xhr.code == "200")
			{	
				setTimeout(function ()
				{
					location.href = xhr.url;
				}, 2000);
			}
			
		})
	}
}