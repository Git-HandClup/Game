var tps = 
{
	g: function (element)
	{
		if (!document.getElementById) { return false; }
		if (arguments.length > 1)
		{
			for (var i = 0, elements = [], length = arguments.length; i < length; i++)
			{
				elements.push($(arguments[i]));
				return elements;
			}
		}
		if (typeof element == "string")
		{
			element = document.getElementById(element);
			return element;
		}
	},
	redirect: function (url)
	{
		window.open(url, "_blank");
	},
	load: function (id)
	{
		var t, fname;
		for (var m = 1; m <= 8; m++)
		{
			$("#item_" + m).removeClass("fixed");
		}
		switch (id)
		{
			case 1: { t = "我的工作台"; fname = "desktop"; }; break;
			case 2: { t = "系统设置"; fname = "system"; }; break;
			case 3: { t = "内容管理"; fname = "content"; }; break;
			case 4: { t = "模板管理"; fname = "template"; }; break;
			case 5: { t = "生成管理"; fname = "create"; }; break;
			case 6: { t = "扩展管理"; fname = "attach"; }; break;
			case 7: { t = "用户管理"; fname = "member"; }; break;
			case 8: { t = "财务管理"; fname = "finance"; }; break;
		}
		$("#item_" + id).addClass("fixed");
		$("#sidebar").loadUrl(TopSource.linkUrl.PANEL + '?m=panel&c=' + fname, null, function () { $("#stitle").html("<span></span>" + t); });
	},
	frame: function ()
	{
		$("#top .menus").width($(document).width() - 184 + "px");
	},
	refresh: function ()
	{
		window.location.reload();
	},
	toggle: function (obj, ele)
	{
		var op = $("input[name='chkoption']");
		var chk = $("input[name='chkall']");
		var m = $("i[name='" + obj + "']");
		var n = $("tr[name='" + ele + "']");
		if (chk.val() == 1)
		{
			n.hide();
			chk.val(0);
			op.attr("title", "全部展开");
			m.removeClass("showfolder").removeClass("hidefolder");
		}
		else
		{
			n.show();
			chk.val(1);
			op.attr("title", "全部隐藏");
			m.removeClass("hidedfolder").addClass("showfolder");
		}
	},
	toggles: function (obj, ele, id)
	{
		var m = $("i[name='" + obj + "']");
		var n = $("tr[name='" + ele + "']");
		m.removeClass("showfolder");
		n.hide();
		$("i[type='mainitem_" + id + "']").addClass("showfolder");
		$("tr[type='subitem_" + id + "']").show();
	},
	upload:function(file,type,frm)
	{
		var durl = $("#upform").attr("action"); 
        var dsbt = $("#upform").attr("onsubmit"); 
		var surl = TopSource.linkUrl.HANDLE + "?m=upload&c=form&field=" + file + "&form=" + frm + "&type=" + type; 
		$("#upform").attr("action",surl);  
       
       $("#upform").attr("onsubmit","return updateCallback(this,uploadAjaxDone)");
       // $("#upform").attr("onsubmit","return true");
    
		$("#upform").submit();	
		$("#upform").attr("action",durl);
		$("#upform").attr("onsubmit",dsbt);
	},
	add:function(obj,ele)
	{
		var list = '';
		var img = $("#" + obj).val();
		var pic = $("#" + ele).val();
		if(img.length > 0)
		{
			list += pic.length <= 0 ?  (pic + img) : (pic + ',' + '\n' + img);
			$("#" + obj).val('');
			$("#" + ele).val(list);
		}		
	},
	clear:function(obj)
	{
		$("#" + obj).val('');
	},
	setskin:function(o,e,k,s)
	{
		var p = k + ":" + s;
		if(o == 3)
		{
			if($(e).attr("checked") != "checked")
				p = "";
		}
		var v = $("#style").val();
		var kv = v.split(";");
		kv.splice(o,1,p);		
		var s = kv.join(";");
		$("#style").val(s);
	},
	timer:function (obj,seconds) 
	{
		var day = parseInt(seconds / 60 / 60 / 24, 10); 
		var hour = parseInt(seconds / 60 / 60 % 24, 10); 
		var min = parseInt(seconds / 60 % 60, 10);
		var sec = parseInt(seconds % 60, 10);
		day = tps.checkTime(day);
		hour = tps.checkTime(hour);
		min = tps.checkTime(min);
		sec = tps.checkTime(sec);
		if (day >= 0 || hour >= 0 || min >= 0 || sec >= 0) 
			$("#" + obj).html(day + "天" + hour + "小时" + min + "分" + sec + "秒");
		if (day <= 0 && hour <= 0 && min <= 0 && sec <= 0) 
		{
			//window.clearInterval(_ordertimer);
			obj.innerHTML = "已过期";
		}
	},
	checkTime:function (i) 
	{ 
		if (i < 10) 
		{
			i = "0" + i;
		}
		return i;
	}
}